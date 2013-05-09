class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.float :total_price
      t.timestamp :date_shipment
      t.integer :user_id

      t.timestamps
    end
    
    add_column :sales, :order_id, :integer
  end
end
