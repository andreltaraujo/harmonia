class Checkout::PaymentsController < BackofficeUsersController
  
  def create
    contract = Contract.find(params[:contract_id])

    order = Order.find_or_create_by(contract: contract, user_id: current_user.id)
    
    payment = PagSeguro::PaymentRequest.new

    payment.reference = order.id
    payment.notification_url = checkout_notifications_url
    payment.redirect_url = backoffice_users_profile_index_url

    payment.items << {
      id: contract.id,
      description: "Adesão Contrato Nº #{contract.number}",
      amount: contract.price.to_s.gsub(',' , '.')
    }

    response = payment.register

    if response.errors.any?
      raise response.errors.join("\n")
    else
      contract.processing!
      order.waiting!
      redirect_to response.url
    end
  end
end

# Comprador de testes
# c76138792981398212250@sandbox.pagseguro.com.brcopiar
# 7gP8fXMGEhX4FAGR