class RenameCategoryNameColumnToCategories < ActiveRecord::Migration[5.1]
  def change
    rename_column :categories, :category_name, :name
  end
end
