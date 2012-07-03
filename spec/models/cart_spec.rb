require 'spec_helper'

describe Cart do
  describe "function total_price" do 
  	context "with no line_items" do 
  		it "should return 0" do
  			@cart = Cart.new
  			@cart.total_price.should == 0
  		end
  	end

  	context "with multiple line_items" do
  		it "should return the proper total" do 
  			@cart = Cart.new
  			@cart.line_items.new(product: Product.new(price: 10), quantity: 10)
  			@cart.line_items.new(product: Product.new(price: 5), quantity: 5)

  			@cart.total_price.should == 125
  		end
  	end
  end
end
