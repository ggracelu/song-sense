# == Schema Information
#
# Table name: likes
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playlist_id :integer
#  user_id     :integer
#
class Like < ApplicationRecord
  belongs_to :liker, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
  belongs_to :liked_playlist, required: true, class_name: "Playlist", foreign_key: "playlist_id", counter_cache: true
end
