class FiscalYear < ApplicationRecord
  has_one :company_profile
  has_many :purchases
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
