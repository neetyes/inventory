class AddCreditLimit < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :credit_limit , :integer
  end
end
