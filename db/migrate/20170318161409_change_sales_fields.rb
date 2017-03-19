class ChangeSalesFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :sales, :cash_credit , :string
    remove_column :sales, :item_name , :string
    remove_column :sales, :unit_sell_price , :decimal
    remove_column :sales, :quantity , :integer
    add_column :sales, :bill_number , :string
    add_column :sales, :sales_date , :date
    add_column :sales, :discount , :decimal
    add_column :sales, :tax , :decimal
    add_column :sales, :grand_total , :string
  end
end
