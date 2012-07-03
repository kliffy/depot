class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
    @cart = current_cart
  	@time = Time.new

  	count = current_count
  	if count > 5 || count == 1
  		@count = count
  	else
  		@count = nil
  	end
  end
end
