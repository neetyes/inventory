class CreateCompanyProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :company_profiles do |t|
      t.string :name
      t.string :vdc_mun
      t.integer :ward_no
      t.string :phone
      t.string :vat_pan_no
      t.string :logo_url
      t.string :district
      t.string :zone

      t.timestamps
    end
  end
end
