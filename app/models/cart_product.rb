class CartProduct < ApplicationRecord
  belongs_to :cart, optional: true
  belongs_to :product, optional: true

  def total_price
    product.price * sales_volume
  end
end
