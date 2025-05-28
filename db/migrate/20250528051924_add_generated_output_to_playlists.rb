class AddGeneratedOutputToPlaylists < ActiveRecord::Migration[7.1]
  def change
    add_column :playlists, :generated_output, :text
  end
end
