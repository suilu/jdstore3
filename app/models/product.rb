class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  def self.search(search)
   where("title LIKE ?", "%#{search}%").or(where("description LIKE ?", "%#{search}%"))
 end
 has_many :comments, dependent: :destroy
 has_many :favorites
 has_many :fans, through: :favorites, source: :user
 has_many :photos
 accepts_nested_attributes_for :photos
end
