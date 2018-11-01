class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name, null: false, index: true
      t.integer :price, null: false
      t.string :size, null: false
      t.integer :quantity, null: false
      t.text :description
      t.text :attention
      t.integer :publishing_status, null: false, default: 0, limit: 1
      t.integer :sales_status, null: false, default: 0, limit: 1
      t.integer :category_id
      t.integer :author_id
      t.timestamps
    end
  end
end
