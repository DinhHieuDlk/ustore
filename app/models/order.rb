class Order < ActiveRecord::Base
	has_many :order_items
	has_many :products, :through => :order_items
	def total
		order_items.to_a.sum{|t| t.lineitem_price}
	end
end
