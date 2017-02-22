class ContractsController < ApplicationController

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    @contract.save
    redirect_to @contract
  end

  def show
    @contract = Contract.find(params[:id])
  end

  private

  def contract_params
    params.require(:contract).permit(
      :client, :equipment, :rental_period,
      :amount, :discount, :delivery_address,
      :contact, :payment_method, :start_date
    )
  end

end
