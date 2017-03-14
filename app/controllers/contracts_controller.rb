class ContractsController < ApplicationController

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

  def finish
    @contract = Contract.find(params[:id])
    @contract.finished = Time.zone.today.to_s
    @contract.save
    redirect_to @contract
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
