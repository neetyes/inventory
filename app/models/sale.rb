class Sale < ApplicationRecord
  belongs_to :customer
  has_many :sale_items, :dependent => :destroy
  accepts_nested_attributes_for :sale_items, :allow_destroy => true
  belongs_to :fiscal_year
end
