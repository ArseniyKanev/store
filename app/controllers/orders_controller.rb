class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.includes(:products)
  end

  def create
    order = Order.create(user: current_user)
    current_user.cart.cart_items.each { |ci| OrderItem.create(order: order, product_id: ci.product_id) }
    current_user.cart.destroy
    redirect_to orders_path
  end
end
