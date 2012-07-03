class Product < ActiveRecord::Base
  attr_accessible :title, :description, :image_url, :price
  has_many :line_items
  has_many :orders, through: :line_items

  validates :description, :image_url, presence: true
  validates :title, presence: { message: "cannot be fucking blank yo!" }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true,
  					 length: { maximum: 20,
  								message: "length maximum is 20"}
  validates :image_url, allow_blank: true, format: {
  	with: /.(gif|jpg|png)/i,
  	message: 'URL must be a gif, jpg, or png'
  }

  before_destroy :ensure_not_referenced_by_any_line_item

  private

    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true #returns true for the object to be destroyed
      else
        errors.add(:base, 'Line Items present')
        return false #will not be destroyed
      end
    end
end
