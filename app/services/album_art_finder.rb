# app/services/album_art_finder.rb
require 'uri'
require 'net/http'
require 'json'

class AlbumArtFinder
  def self.find_cover(song_title, artist_name)
    query = URI.encode_www_form_component("#{song_title} #{artist_name}")
    url = URI("https://itunes.apple.com/search?term=#{query}&entity=song&limit=1")

    response = Net::HTTP.get(url)
    results = JSON.parse(response)

    if results["resultCount"] > 0
      results["results"].first["artworkUrl100"].gsub("100x100", "300x300")
    else
      "https://source.unsplash.com/300x300/?music"
    end
  rescue
    "https://source.unsplash.com/300x300/?music"
  end
end
