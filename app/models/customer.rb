class Customer < ApplicationRecord
  has_many :sales
  validates :name, presence: true
  validates :contact_no, presence: true
end
