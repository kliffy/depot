class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
  	@time = Time.new
  end
end
