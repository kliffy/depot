class Product < ActiveRecord::Base
  attr_accessible :title, :description, :image_url, :price
end
