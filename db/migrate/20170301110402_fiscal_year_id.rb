class FiscalYearId < ActiveRecord::Migration[5.0]
  def change
    add_column :company_profiles, :fiscal_year_id, :integer
  end
end
