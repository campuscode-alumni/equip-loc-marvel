class ReturnReceiptsController < ApplicationController
  def new
    @return_receipt = ReturnReceipt.new
  end
  def create
    return_params = params.require(:return_receipt).permit(:name,:cpf)
    @return_receipt = ReturnReceipt.new(return_params)
    @return_receipt.save
    redirect_to @return_receipt
  end
  def show
    @return_receipt = ReturnReceipt.find(params[:id])
  end
end
