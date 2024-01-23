class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "id_value", "post_id", "updated_at", "user_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["likes", "post", "user"]
  end
end

