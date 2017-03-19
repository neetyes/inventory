class ChangePurchase < ActiveRecord::Migration[5.0]
  def change
    remove_column :purchases, :item_id , :integer
  end
end
