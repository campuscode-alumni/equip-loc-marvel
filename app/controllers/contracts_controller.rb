class ContractsController < ApplicationController

  def index
  end

  def new
    @contract = Contract.new
    @customers = Customer.all
    @equipment = Equipment.all
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract
    else
      @equipment = Equipment.all
      @customers = Customer.all
      render 'new'
    end
  end

  def show
    @contract = Contract.find(params[:id])
  end

  private

  def contract_params
    params.require(:contract).permit(
      :customer_id, :rental_period,
      :amount, :discount, :delivery_address,
      :contact, :payment_method, :start_date,
      equipment_ids: []
    )
  end

end
