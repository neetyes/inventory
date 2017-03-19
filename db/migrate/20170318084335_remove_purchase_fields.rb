class RemovePurchaseFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :purchases, :unit_cost_price , :decimal
    remove_column :purchases, :quantity , :integer
    remove_column :purchases, :cash_credit , :string
  end
end
