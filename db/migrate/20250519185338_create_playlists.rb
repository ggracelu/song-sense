class CreatePlaylists < ActiveRecord::Migration[7.1]
  def change
    create_table :playlists do |t|
      t.string :song1
      t.string :song2
      t.string :song3
      t.string :song4
      t.string :song5
      t.string :song6
      t.string :song7
      t.string :song8
      t.integer :user_id
      t.string :color1
      t.string :color2
      t.string :color3
      t.string :color4
      t.string :color5
      t.string :scent1
      t.string :scent2
      t.string :texture
      t.integer :likes_count

      t.timestamps
    end
  end
end
