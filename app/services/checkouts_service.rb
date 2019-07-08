class CheckoutsService
  TRANSACTION_SUCCESS_STATUSES = [
    Braintree::Transaction::Status::Authorizing,
    Braintree::Transaction::Status::Authorized,
    Braintree::Transaction::Status::Settled,
    Braintree::Transaction::Status::SettlementConfirmed,
    Braintree::Transaction::Status::SettlementPending,
    Braintree::Transaction::Status::Settling,
    Braintree::Transaction::Status::SubmittedForSettlement,
  ]


  def self._create_result_hash(transaction)
      status = transaction.status

    if TRANSACTION_SUCCESS_STATUSES.include? status
      result_hash = {
        :header => "Sweet Success!",
        :icon => "success",
        :message => "Your test transaction has been successfully processed. See the Braintree API response and try again."
      }
    else
      result_hash = {
        :header => "Transaction Failed",
        :icon => "fail",
        :message => "Your test transaction has a status of #{status}. See the Braintree API response and try again."
      }
    end
  end

  def self.gateway
    env = ENV["BT_ENVIRONMENT"]

    @gateway ||= Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => "s8p9drdp94ycm27d",
      :public_key => "gxw4gyf4xqw7q9ts",
      :private_key => "6bbc45dd3315451b75383c435cd767c5",
    )
  end

   def self.transaction_sale(amount,nonce)
    gateway.transaction.sale(
    amount: amount,
    payment_method_nonce: nonce,
    :options => {
      :submit_for_settlement => true
    }
  )
  end


 end 