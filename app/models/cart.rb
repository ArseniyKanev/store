class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def total_price
    products.sum(:price)
  end
end
