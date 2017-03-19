class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :supplier_id
      t.integer :item_id
      t.decimal :unit_cost_price
      t.integer :quantity
      t.string :cash_credit
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
