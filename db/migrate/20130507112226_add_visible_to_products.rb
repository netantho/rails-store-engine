class AddVisibleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :visible, :boolean, :default => false
  end
end
