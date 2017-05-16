class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    product_ids = current_user.cart.try(:product_ids)
    @cart_products = product_ids ? Product.find(product_ids) : []
    @total = current_user.cart.try(:total_price)
  end

  def add
    if cart = current_user.cart
      CartItem.create(cart: cart, product_id: params[:product_id])
    else
      cart = Cart.create(user: current_user)
      cart.cart_items << CartItem.create(product_id: params[:product_id])
    end
    render nothing: true, status: :ok
  end

  def remove
    cart = current_user.cart
    cart_item = cart.cart_items.find_by_product_id(params[:product_id])
    cart_item.destroy
    cart.destroy if cart.cart_items.empty?
    render nothing: true, status: :ok
  end

  def total
    render json: { total: current_user.cart.try(:total_price), status: :ok }
  end
end
