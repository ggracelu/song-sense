class AddArtistsToPlaylists < ActiveRecord::Migration[7.1]
  def change
    add_column :playlists, :artist1, :string
    add_column :playlists, :artist2, :string
    add_column :playlists, :artist3, :string
    add_column :playlists, :artist4, :string
    add_column :playlists, :artist5, :string
    add_column :playlists, :artist6, :string
    add_column :playlists, :artist7, :string
    add_column :playlists, :artist8, :string
  end
end
