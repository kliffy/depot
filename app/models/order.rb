class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type
  PAYMENT_TYPES = [ 'Check', 'Credit Card', 'Purchase Order' ]

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  has_many :line_items, dependent: :destroy

  def add_line_items_from_cart(cart)
  	cart.line_items.each do |item|
  		#this basically takes away the reference to the cart then adds it to the order
  		item.cart_id = nil #so that when a cart is deleted, these line_items are still alive for the order model
  		line_items << item
  	end
  end
end
