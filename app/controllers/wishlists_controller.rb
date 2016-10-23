class WishlistsController < ApplicationController
	before_action :authenticate_user!
	def index
				@wishlist = current_wishlist
	end

	def create
			@item = current_wishlist.wishlist_items.build(product_id: params[:product_id]).save
			redirect_to :back, notice:"wish list was successfully creates...."
		end

	def destroy
		
		@item = WishlistItem.find(params[:id])
		@item.destroy
		respond_to do |format|
			format.html
			format.js
		end
		
	end

end
