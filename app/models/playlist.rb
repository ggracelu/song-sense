class Playlist < ApplicationRecord
  belongs_to :creator, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
  has_many  :likes, class_name: "Like", foreign_key: "playlist_id", dependent: :destroy
end
