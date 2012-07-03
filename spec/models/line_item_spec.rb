require 'spec_helper'

describe LineItem do
  describe "total_price should return proper amount" do 
  	before :each do 
  		@product = Product.new(price: 10)
  		@line_item = LineItem.new(product: @product)
  		#@line_item.quantity = 0
  	end

  	context "with zero quantity" do 
  		it "should return zero" do
  			@line_item.quantity = 0
  			@line_item.total_price.should == 0
  		end
  	end

  	context "with more than 1 quantity" do 
  		it "should return the total" do 
  			@line_item.quantity = 10
  			@line_item.total_price.should == 100
  		end
  	end
  end
end
