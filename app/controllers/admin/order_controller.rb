class Admin::OrderController < Admin::ApplicationController
  load_and_authorize_resource
  def index
  	if params[:status].blank?
  	@orders = Order.all
  else
  	@orders = Order.where(status: params[:status])
  end
  end

  def show
  	@order = Order.find(params[:id])
  end

  def close
  	@order = Order.find(params[:id])
  	@order.update_attributes(status: 'closed')
  	if @order.save
  	flash[:notice] = "Order #{@order.id} has been closed"
	redirect_to :action => 'index', :status => 'closed'
end
  end
end
