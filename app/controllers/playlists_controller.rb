class PlaylistsController < ApplicationController
  def index
    matching_playlists = Playlist.all

    @list_of_playlists = matching_playlists.order({ :created_at => :desc })

    render({ :template => "playlists/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_playlists = Playlist.where({ :id => the_id })

    @the_playlist = matching_playlists.at(0)

    render({ :template => "playlists/show" })
  end

  def create
    the_playlist = Playlist.new
    the_playlist.song1 = params.fetch("query_song1")
    the_playlist.song2 = params.fetch("query_song2")
    the_playlist.song3 = params.fetch("query_song3")
    the_playlist.song4 = params.fetch("query_song4")
    the_playlist.song5 = params.fetch("query_song5")
    the_playlist.song6 = params.fetch("query_song6")
    the_playlist.song7 = params.fetch("query_song7")
    the_playlist.song8 = params.fetch("query_song8")
    the_playlist.user_id = params.fetch("query_user_id")
    the_playlist.color1 = params.fetch("query_color1")
    the_playlist.color2 = params.fetch("query_color2")
    the_playlist.color3 = params.fetch("query_color3")
    the_playlist.color4 = params.fetch("query_color4")
    the_playlist.color5 = params.fetch("query_color5")
    the_playlist.scent1 = params.fetch("query_scent1")
    the_playlist.scent2 = params.fetch("query_scent2")
    the_playlist.texture = params.fetch("query_texture")
    the_playlist.likes_count = params.fetch("query_likes_count")

    if the_playlist.valid?
      the_playlist.save
      redirect_to("/playlists", { :notice => "Playlist created successfully." })
    else
      redirect_to("/playlists", { :alert => the_playlist.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_playlist = Playlist.where({ :id => the_id }).at(0)

    the_playlist.song1 = params.fetch("query_song1")
    the_playlist.song2 = params.fetch("query_song2")
    the_playlist.song3 = params.fetch("query_song3")
    the_playlist.song4 = params.fetch("query_song4")
    the_playlist.song5 = params.fetch("query_song5")
    the_playlist.song6 = params.fetch("query_song6")
    the_playlist.song7 = params.fetch("query_song7")
    the_playlist.song8 = params.fetch("query_song8")
    the_playlist.user_id = params.fetch("query_user_id")
    the_playlist.color1 = params.fetch("query_color1")
    the_playlist.color2 = params.fetch("query_color2")
    the_playlist.color3 = params.fetch("query_color3")
    the_playlist.color4 = params.fetch("query_color4")
    the_playlist.color5 = params.fetch("query_color5")
    the_playlist.scent1 = params.fetch("query_scent1")
    the_playlist.scent2 = params.fetch("query_scent2")
    the_playlist.texture = params.fetch("query_texture")
    the_playlist.likes_count = params.fetch("query_likes_count")

    if the_playlist.valid?
      the_playlist.save
      redirect_to("/playlists/#{the_playlist.id}", { :notice => "Playlist updated successfully."} )
    else
      redirect_to("/playlists/#{the_playlist.id}", { :alert => the_playlist.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_playlist = Playlist.where({ :id => the_id }).at(0)

    the_playlist.destroy

    redirect_to("/playlists", { :notice => "Playlist deleted successfully."} )
  end
end
