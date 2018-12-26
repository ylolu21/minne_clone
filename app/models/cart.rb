class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  def total_price
    cart_products.to_a.sum { |item| item.total_price }
  end
end
