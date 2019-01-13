class ChangeDatatypeSalesVolumeOfCartProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :cart_products, :sales_volume, :integer, default: 1
  end
end
