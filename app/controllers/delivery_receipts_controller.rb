class DeliveryReceiptsController < ApplicationController

  def create
    contract = Contract.find(params[:contract_id])
    delivery_receipt = DeliveryReceipt.create(contract: contract)
    redirect_to delivery_receipt
  end

  def show
    @delivery_receipt = DeliveryReceipt.find(params[:id])

  end

end
