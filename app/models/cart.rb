class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy

  def add_product(product)
  	current_item = line_items.find_by_product_id(product.id)
  	if current_item
  		current_item.quantity += 1
  	else
  		current_item = line_items.build(product_id: product.id, price: product.price)
  	end
  	current_item
  end

  def total_price
  	line_items.map{|v| v.total_price}.sum
  end
end
