class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.string :item_name
      t.decimal :unit_sell_price
      t.integer :quantity
      t.string :cash_credit
      t.integer :customer_id
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
