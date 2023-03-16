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
end
