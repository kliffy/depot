json.product do |json|
	json.id @product.id
	json.title @product.title
	json.orders do |json|
		json.array!(@product.orders) do |json, order|
			json.id order.id
			json.name order.name
			json.address order.address
			json.pay_type order.pay_type
		end
	end
end