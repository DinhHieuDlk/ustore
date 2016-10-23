class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
   def lineitem_price
  	product.price*amount
  end
end
