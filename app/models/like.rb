class Like < ApplicationRecord
  belongs_to :liker, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
  belongs_to :liked_playlist, required: true, class_name: "Playlist", foreign_key: "playlist_id", counter_cache: true
end
