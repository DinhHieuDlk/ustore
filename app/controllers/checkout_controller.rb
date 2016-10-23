class CheckoutController < ApplicationController
  def index
  	@order = Order.new
  	@cart = current_cart
  	if @cart.line_items.empty?
  		redirect_to products_path, notice: "Your shopping cart is empty!"
  		
  	end
  end

  def place_order
    @order= Order.new(checkout_params)
    @order.customer_ip = request.remote_ip
    @order.status = 'processed'
    populate_order
    if @order.save    
      current_cart.line_items.destroy_all
      Notification.order(@order).deliver_later
      redirect_to :action => 'thank_you'
    else
      render :action => 'index'
  end
end

  def thank_you
  end
  private
    def checkout_params
        params.require(:order).permit(:email, :phone_number, :ship_to_first_name, :ship_to_last_name, :ship_to_address, :ship_to_city,  :ship_to_postal_code, :ship_to_country, :customer_ip, :status, :card_type, :card_number,   :card_expiration, :card_verification_value)  
    end
    def populate_order
      for cart_item in current_cart.line_items
        order_item = OrderItem.new(
          :product_id =>cart_item.product_id,
          :price => cart_item.product.price,
          :amount => cart_item.quantity
          )
        @order.order_items << order_item
      end
    end


end
