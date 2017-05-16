class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
end
