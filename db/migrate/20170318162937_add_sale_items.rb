class AddSaleItems < ActiveRecord::Migration[5.0]
  def change
    add_column :sale_items, :total , :decimal
  end
end
