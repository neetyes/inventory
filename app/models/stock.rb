class Stock < ApplicationRecord
  belongs_to :item, required:false

  validates :quantity, presence: true
  validates :unit_price, presence: true
  validates :est_sell_price, presence: true
end
