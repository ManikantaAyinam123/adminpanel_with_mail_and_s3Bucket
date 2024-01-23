class Post < ApplicationRecord
  belongs_to :user
    has_many :comments,dependent: :destroy
    has_many :likes, as: :likeable, dependent: :destroy
  
    validates :title, presence: true
    validates :content, presence: true
    
    has_one_attached :image
    has_many_attached :photos
  
 
  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "id_value", "title", "updated_at", "user_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["comments", "image_attachment", "image_blob", "likes", "photos_attachments", "photos_blobs", "user"]
  end
end
 
