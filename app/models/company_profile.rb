class CompanyProfile < ApplicationRecord
  has_many :fiscal_years, :dependent => :destroy

  validates :name, presence: true, length: {maximum: 30,minimum:2 }
  validates :vdc_mun, presence: true
  validates :ward_no, presence: true, numericality: {only_integer: true},length: {maximum: 2 }
  validates :phone, presence: true, numericality: {only_integer: true}
  validates :vat_pan_no, presence: true, numericality: {only_integer: true}

  validates :district, presence: true
  validates :zone, presence: true

  mount_uploader :logo_url, LogoUploader
end
