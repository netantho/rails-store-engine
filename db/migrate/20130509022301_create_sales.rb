class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :quantity
      t.float :price
      t.integer :product_id

      t.timestamps
    end
  end
end
