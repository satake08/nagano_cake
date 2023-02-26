class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_product, dependent: :destroy
  belongs_to :genre
end
