class User < ApplicationRecord

  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :photos
  has_many :relationships
  
  has_many :user_likes
  has_many :favorite_photos, through: :user_likes, source: :photo
  
  def like(favorite_photo)
    unless self == favorite_photo.user
      self.user_likes.find_or_create_by(photo_id: favorite_photo.id)
    end
  end

  def unlike(favorite_photo)
    user_like = self.user_likes.find_by(photo_id: favorite_photo.id)
    user_like.destroy if user_like
  end
  
  def like?(favorite_photo)
    self.favorite_photos.include?(favorite_photo)
  end

  def feed_photos
    Photo.where(user_id: self.photo_ids + [self.id])
  end
end
