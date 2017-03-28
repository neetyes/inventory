class ChangeSaleItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :sale_items, :quantity , :string
    add_column :sale_items, :quantity , :integer
  end
end
