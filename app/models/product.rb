class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0.0 }
  validates :category, presence: true

  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [320, 240]
  end

  def to_param
    "#{id}-#{name}".parameterize
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "long_description", "name", "photo", "price", "updated_at"]
  end


  def self.ransackable_associations(auth_object = nil)
    ["category", "photo_attachment", "photo_blob"]
  end
end
