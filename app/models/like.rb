class Like < ApplicationRecord
  belongs_to :user
 
  belongs_to :likeable, polymorphic: true

  validates_uniqueness_of :user_id, scope: [:likeable_type, :likeable_id]
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "likeable_id", "likeable_type", "updated_at", "user_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["likeable", "user"]
  end
end
