class AddAlbumArtToPlaylists < ActiveRecord::Migration[7.1]
  def change
    add_column :playlists, :album_art1, :string
    add_column :playlists, :album_art2, :string
    add_column :playlists, :album_art3, :string
    add_column :playlists, :album_art4, :string
    add_column :playlists, :album_art5, :string
    add_column :playlists, :album_art6, :string
    add_column :playlists, :album_art7, :string
    add_column :playlists, :album_art8, :string
  end
end
