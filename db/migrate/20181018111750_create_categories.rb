class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.integer :category_code, null: false
      t.string :category_path, null: false
      t.string :category_name,null: false, index: true
      t.timestamps
    end
  end
end
