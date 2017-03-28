class Customer < ApplicationRecord
  has_many :sales
  validates :name, presence: true
end
