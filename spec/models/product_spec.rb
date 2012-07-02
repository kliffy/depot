require 'spec_helper'

describe Product do 
	before do
		@product = Product.new(title: "blah", 
								description: "blah",
								image_url: "blah.jpg",
								price: 10.00)
	end

	describe "invalid price" do 
		before { @product.price = 0 }
		it { should_not be_valid }
	end

	describe "invalid image" do
		before { @product.image_url = "blah.jpeg" }
		it { should_not be_valid }
	end
end