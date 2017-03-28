class AddCreditlimitPurchase < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :credit_limit , :integer
  end
end
