class CreateSaleItems < ActiveRecord::Migration[5.0]
  def change
    create_table :sale_items do |t|
      t.decimal :unit_price
      t.string :item_id
      t.string :sale_id
      t.string :quantity

      t.timestamps
    end
  end
end
