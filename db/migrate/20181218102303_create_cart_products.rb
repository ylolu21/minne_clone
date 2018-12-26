class CreateCartProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_products do |t|
      t.references :cart, null: false, foreign_key: true, index: true
      t.references :product, null: false, foreign_key: true, index: true
      t.integer :sales_volume

      t.timestamps
    end
  end
end
