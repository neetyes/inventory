class Item < ApplicationRecord
  belongs_to :unit, required:false
  belongs_to :item_group, required:false
  has_one :stock, dependent: :destroy,inverse_of: :item
  accepts_nested_attributes_for :stock
  has_many :sales
  has_many :purchase_items
  has_many :sale_items
  validates :name, presence: true
  validates :unit_id, presence: true
  validates :item_code, presence: true
  validates :item_group_id, presence: true
  validates :description, presence: true
end
