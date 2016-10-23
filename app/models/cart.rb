class Cart < ActiveRecord::Base
	has_many :carts
	has_many :products
	has_many :line_items,  dependent: :destroy
	def total_price
		line_items.to_a.sum{|item| item.lineitem_price}

	end
	def total_quantity
		line_items.to_a.sum{|item| item.quantity}

	end
	def add_to_cart(products , quantity)
		current_item = line_items.where(:product_id => products).first
		if current_item
			current_item.quantity+=quantity.to_i
		else
			current_item= line_items.build(:product_id=>products,  :quantity=>quantity)

		end
		current_item
	end

end
