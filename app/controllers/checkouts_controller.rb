class CheckoutsController < ApplicationController

  def new
    @client_token = CheckoutsService.gateway.client_token.generate
  end

  def show
    @transaction = CheckoutsService.gateway.transaction.find(params[:id])
    @result = CheckoutsService._create_result_hash(@transaction)
  end

  def create
    result = CheckoutsService.transaction_sale(params["amount"],params["payment_method_nonce"] )
    if result.success? || result.transaction
      redirect_to checkout_path(result.transaction.id)
    else
      flash[:error] = result.errors {|error| "Error: #{error.code}: #{error.message}" }
      redirect_to new_checkout_path
    end
  end
  

end






      
