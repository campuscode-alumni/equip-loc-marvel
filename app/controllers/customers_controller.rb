class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

 def create
   customer_params= params.require(:customer).permit(:name, :customer_type, :document, :adress, :email, :contact_name, :phone_number, :state_registration, :vip)
   @customer = Customer.create(customer_params)
   redirect_to customer_path(@customer)
 end

 def show
  @customer = Customer.find(params[:id])
 end


end
