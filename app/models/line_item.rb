class LineItem < ActiveRecord::Base
	attr_accessible :product

  belongs_to :product
  belongs_to :cart
end
