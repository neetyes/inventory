class AddPurchaseFields < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :bill_number , :string
    add_column :purchases, :purchase_date , :date
    add_column :purchases, :discount , :decimal
    add_column :purchases, :tax , :decimal
    add_column :purchases, :grand_total , :decimal
  end
end
