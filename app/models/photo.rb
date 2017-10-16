class Photo < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  validates :user_id, presence: true
  validates :image, presence: true
  validates :photo_comment, presence: false, length: { maximum: 255 }
  
  has_many :user_likes
  has_many :favorite_users, through: :user_likes, source: :user
  
end
