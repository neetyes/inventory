class CreatePurchaseItems < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_items do |t|
      t.string :item_name
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :total
      t.integer :purchase_id

      t.timestamps
    end
  end
end
