class CartsController < ApplicationController

  before_action :set_cart_params, only: [:show]

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @cart_products = @cart.cart_products.includes(:product)
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def set_cart_params
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:total_price, :user_id)
  end


end
