class Product < ActiveRecord::Base
  attr_accessible :title, :description, :image_url, :price

  validates :description, :image_url, presence: true
  validates :title, presence: { message: "cannot be fucking blank yo!" }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true,
  					 length: { maximum: 10,
  								message: "length maximum is 10"}
  validates :image_url, allow_blank: true, format: {
  	with: /.(gif|jpg|png)/i,
  	message: 'URL must be a gif, jpg, or png'
  }
end
