# == Schema Information
#
# Table name: playlists
#
#  id               :bigint           not null, primary key
#  album_art1       :string
#  album_art2       :string
#  album_art3       :string
#  album_art4       :string
#  album_art5       :string
#  album_art6       :string
#  album_art7       :string
#  album_art8       :string
#  artist1          :string
#  artist2          :string
#  artist3          :string
#  artist4          :string
#  artist5          :string
#  artist6          :string
#  artist7          :string
#  artist8          :string
#  color1           :string
#  color2           :string
#  color3           :string
#  color4           :string
#  color5           :string
#  generated_input  :text
#  generated_output :text
#  likes_count      :integer
#  scent1           :string
#  scent2           :string
#  song1            :string
#  song2            :string
#  song3            :string
#  song4            :string
#  song5            :string
#  song6            :string
#  song7            :string
#  song8            :string
#  texture          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#
class Playlist < ApplicationRecord
  belongs_to :creator, optional: true, class_name: "User", foreign_key: "user_id", counter_cache: true
  has_many  :likes, class_name: "Like", foreign_key: "playlist_id", dependent: :destroy

  def incomplete?
    color1.blank? || scent1.blank? || texture.blank? || generated_output.blank?
  end

  def next_incomplete_step_path
    if color1.blank?
      "/playlists/#{id}/colors"
    elsif scent1.blank?
      "/playlists/#{id}/scents"
    elsif texture.blank?
      "/playlists/#{id}/textures"
    elsif generated_output.blank?
      "/playlists/#{id}/generate"
    else
      "/playlists/#{id}"
    end
  end


end
