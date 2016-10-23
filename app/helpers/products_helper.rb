module ProductsHelper
	def button_wishlist
		if user_signed_in?
	        if User.wishlist_product @product, current_user
	            button_to "remove",controller: "wishlists", action: "create", product_id: @product.id, class:"fa fa-heart"
	        else
	          button_to "add_to_wishlist",controller: "wishlists", action: "create", product_id: @product.id
	        end
	        else
	       	 button_to "add_to_wishlist",controller: "wishlists", action: "create", product_id: @product.id
	        end

	end
end
