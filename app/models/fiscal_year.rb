class FiscalYear < ApplicationRecord
  belongs_to :company_profile, required:false
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
