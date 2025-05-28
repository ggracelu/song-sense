require "openai/chat"

class PlaylistsController < ApplicationController
  def generate
    @playlist = Playlist.find(params[:path_id])
    user_input = build_description(@playlist)

    # Set input string
    @playlist.generated_input = user_input

    # Build and send prompt
    chat = OpenAI::Chat.new(api_token: ENV["OPENAI_TOKEN"])
    chat.system("You are a music connoisseur with synesthesia. Curate a playlist based on these sensations. Return a list of 8 songs and artists in this format: (song1-title, artist1), (song2-title, artist2), etc.")
    chat.user(user_input)

    response = chat.assistant!
    result = response

    # Save raw result now — even if parsing fails
    @playlist.generated_output = result
    @playlist.save! # Save both input and output right away

    # Now attempt to parse songs
    matches = result.scan(/\(([^,]+),\s*([^)]+)\)/)

    if matches.size == 8
      matches.each_with_index do |(title, artist), index|
        @playlist["song#{index + 1}"] = title.strip
        @playlist["artist#{index + 1}"] = artist.strip
        cover_url = AlbumArtFinder.find_cover(title.strip, artist.strip)
        @playlist["album_art#{index + 1}"] = cover_url
      end
      @playlist.save! # Save again now that songs are set
      redirect_to("/playlists/#{@playlist.id}")
    else
      redirect_to("/playlists/#{@playlist.id}/textures", alert: "Failed to parse all 8 songs. Try again.")
    end
  end


  def start
    @playlist = Playlist.create(user_id: nil)
    @playlist.user_id = current_user.id if user_signed_in?
    @playlist.likes_count = 0
    if @playlist.save
      redirect_to("/playlists/#{@playlist.id}/colors")
      else
        redirect_to("/", alert: "Something went wrong creating your playlist. Please try again.")
    end
  end

  def index
    matching_playlists = Playlist.all

    @list_of_playlists = matching_playlists.order({ :created_at => :desc })

    render({ :template => "playlists/index" })
  end

  def show
    playlist_id = params[:id] || params[:path_id]
    @the_playlist = Playlist.find_by(id: playlist_id)

    if @the_playlist.nil?
      redirect_to("/playlists", alert: "Playlist not found.")
      return
    end

    render({ :template => "playlists/show" })
  end


  def destroy
    the_id = params.fetch("id")  # changed from "path_id" to "id"
    the_playlist = Playlist.where({ :id => the_id }).at(0)
    the_playlist.destroy
    redirect_to("/profile", { :notice => "Playlist deleted successfully." })
  end


  # COLORS PAGE
  def colors
    playlist_id = params.fetch("path_id")
    @playlist = Playlist.find_by(id: playlist_id)

    if @playlist.nil?
      redirect_to("/", alert: "Playlist not found.")
      return
    end
  end

  def update_colors
    @playlist = Playlist.find(params[:path_id])

    @playlist.color1 = params[:color1]
    @playlist.color2 = params[:color2]
    @playlist.color3 = params[:color3]
    @playlist.color4 = params[:color4]
    @playlist.color5 = params[:color5]

    if @playlist.save
      redirect_to("/playlists/#{@playlist.id}/scents")
    else
      redirect_to("/playlists/#{@playlist.id}/colors", alert: "Please select at least one color.")
    end
  end

  def scents
    playlist_id = params.fetch("path_id")
    @playlist = Playlist.find_by(id: playlist_id)

    if @playlist.nil?
      redirect_to("/", alert: "Playlist not found.")
      return
    end
  end

  def update_scents
    @playlist = Playlist.find_by(id: params[:path_id])

    @playlist.scent1 = params[:scent1]
    @playlist.scent2 = params[:scent2]

    if @playlist.save
      redirect_to("/playlists/#{@playlist.id}/textures")
    else
      redirect_to("/playlists/#{@playlist.id}/scents", alert: "Please select up to 2 scents.")
    end
  end

  def textures
    @playlist = Playlist.find_by(id: params[:path_id])

    if @playlist.nil?
      redirect_to("/", alert: "Playlist not found.")
      return
    end
  end

  def update_textures
    @playlist = Playlist.find_by(id: params[:path_id])

    @playlist.texture = params[:texture]

    if @playlist.save
      render inline: <<-HTML
      <form id="generateForm" action="/playlists/#{@playlist.id}/generate" method="post">
        <input type="hidden" name="authenticity_token" value="#{form_authenticity_token}">
      </form>
      <script>
        document.getElementById("generateForm").submit();
      </script>
    HTML

    else
      redirect_to("/playlists/#{@playlist.id}/textures", alert: "Please select a texture.")
    end
  end

  def build_description(playlist)
    colors = [playlist.color1, playlist.color2, playlist.color3, playlist.color4, playlist.color5].compact.join(", ")
    scents = [playlist.scent1, playlist.scent2].compact.join(" and ")
    texture = playlist.texture

    "Colors: #{colors}. Scent: #{scents}. Texture: #{texture}."
  end

end
