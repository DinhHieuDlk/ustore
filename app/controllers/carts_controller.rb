class CartsController < ApplicationController
	def show
		@cart = current_cart
		if @cart.line_items.empty?
			redirect_to products_path, notice: "your cart empty!"
			
		end
	end

end
