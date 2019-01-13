class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.integer    :total_price
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
