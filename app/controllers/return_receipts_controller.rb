class ReturnReceiptsController < ApplicationController
  def new
    @contract = Contract.find(params[:contract_id])
    @return_receipt = ReturnReceipt.new
  end
  def create
    @contract = Contract.find(params[:contract_id])
    return_params = params.require(:return_receipt).permit(:name,:cpf)
    @return_receipt = ReturnReceipt.new(return_params)
    @return_receipt.contract = @contract
    @return_receipt.save!
    redirect_to @return_receipt
  end
  def show
    @return_receipt = ReturnReceipt.find(params[:id])
  end
end
