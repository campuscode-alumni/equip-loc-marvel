class ContractsController < ApplicationController

  def new
    @contract = Contract.new
    @equipment = Equipment.all
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract
    else
      @equipment = Equipment.all
      render 'new'
    end
  end

  def show
    @contract = Contract.find(params[:id])
  end

  private

  def contract_params
    params.require(:contract).permit(
      :client, :rental_period,
      :amount, :discount, :delivery_address,
      :contact, :payment_method, :start_date,
      equipment_ids: []
    )
  end

end
