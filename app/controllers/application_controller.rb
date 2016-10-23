class ApplicationController < ActionController::Base

 def after_sign_in_path_for(resource)
  if current_user.admin
    '/admin/dashboard/index'
  else
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
  def current_cart
  	@cart = Cart.find(session[:cart_id])
	  rescue ActiveRecord::RecordNotFound
	  	@cart=Cart.create
	  	session[:cart_id]= @cart.id
      @cart
	end
  def current_order
    @order=Order.find(session[:order_id])
    rescue ActiveRecord::RecordNotFound
      @order=Order.create
    session[:order_id] = @order.id
    @order
  end
  def current_wishlist
    @wishlist = Wishlist.find(session[:wishlist_id])
    rescue ActiveRecord::RecordNotFound
      @wishlist = current_user.wishlists.create
      session[:wishlist_id] = @wishlist.id
      @wishlist
      #code
  end
  helper_method :current_cart

end
