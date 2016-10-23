class Notification < ApplicationMailer
  default from: 'no-reply@website.com'
 def order(order)
    @order = order
    @line_item = @order.order_items
    mail( :to => @order.email , :subject => 'Store Order')
  end
end
