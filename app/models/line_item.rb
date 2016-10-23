class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  belongs_to :order
  def lineitem_price
  	product.price*quantity
  end
end
