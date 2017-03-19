class Purchase < ApplicationRecord
  belongs_to :supplier, required: false
  belongs_to :item
  has_many :purchase_items
  accepts_nested_attributes_for :purchase_items
end

