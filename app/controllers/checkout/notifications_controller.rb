class Checkout::NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    puts ">>>> Chegou aqui <<<<"
    transaction = PagSeguro::Transaction.find_by_notification_code(params[:notificationCode])
    #puts ">>>> #{transaction}"
    raise transaction.errors.join("\n")
    
    if transaction.errors.empty?
      status_code = transaction.status.id.to_i
      order_id = transaction.reference.id.to_i
    
      order = Order.find(order_id)
      order.status = status_code
      order.save
      
      if status_code == 3
        contract = Contract.find(order.contract.id)
        contract.paid!
      end
    end
    
    render index: true, status: 200
  end
end