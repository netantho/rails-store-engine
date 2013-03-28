class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.references :category
      t.references :product

      t.timestamps
    end
    add_index :classifications, :category_id
    add_index :classifications, :product_id
  end
end
