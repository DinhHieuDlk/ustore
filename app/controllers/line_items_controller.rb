class LineItemsController < ApplicationController
	before_action :current_cart, only:[:create]
	def create
		@product = Product.find(params[:product_id])
		@quantity = params[:quantity]
		@line_item = @cart.add_to_cart(@product.id, @quantity)
		 respond_to do |format|
		if @line_item.save
		format.html { redirect_to :back, notice: 'Product was add to cart.' }
        format.js
      else
        format.html { notice:"product not add to cart" }
		
		end
	end
end
def destroy
	@line_item= LineItem.find(params[:id]).destroy
	redirect_to current_cart
end
end
