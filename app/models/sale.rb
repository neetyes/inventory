class Sale < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  has_many :sale_items
  accepts_nested_attributes_for :sale_items
end
