class AddPriceFromProductIntoLineItem < ActiveRecord::Migration
  def change
		add_column :line_items, :price, :float
		LineItem.all.each do |item|
			item.price = item.product.price
			item.save!
		end
  end
end
