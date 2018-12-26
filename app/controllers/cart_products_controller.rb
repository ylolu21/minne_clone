class CartProductsController < ApplicationController
  before_action :set_cart_product, only: [:show, :destroy]
  before_action :cart_product_params, only: [:new, :create, :delete]
  def new
    @cart_product = CartProduct.new
  end

  def create
    @cart = current_cart
    @cart_product = @cart.cart_products.find_by_product_id(cart_product_params[:product_id])
    if @cart_product
      @cart_product.sales_volume += 1
    else
      @cart_product = @cart.cart_products.new(cart_product_params)
    end

    respond_to do |format|
      if @cart_product.save
        format.html { redirect_to @cart_product.cart, notice: 'カートに商品が追加されました。' }
        format.json { render :show, status: :created, location: @cart_product }
      else
        format.html { render :show }
        format.json { render json: @cart_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart_product.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(current_cart.id) }
      format.json {}
    end
  end

  private

  def set_cart_product
    @cart_product = CartProduct.find(params[:id])
  end

  def cart_product_params
    params.require(:cart_product).permit(:product_id, :user_id, :sales_volume).merge(cart_id: current_cart.id)
  end
end
