class AddGeneratedInputToPlaylists < ActiveRecord::Migration[7.1]
  def change
    add_column :playlists, :generated_input, :text
  end
end
