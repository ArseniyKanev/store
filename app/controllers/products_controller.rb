class ProductsController < ApplicationController
  before_action :set_product, only: :show

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_action = current_user.try(:cart) ? (current_user.cart.products.include?(@product) ? "Remove from cart" : "Add to cart") : "Add to cart"
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end
