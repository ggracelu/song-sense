class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many  :playlists, class_name: "Playlist", foreign_key: "user_id", dependent: :destroy
  has_many  :likes, class_name: "Like", foreign_key: "user_id", dependent: :destroy
end
