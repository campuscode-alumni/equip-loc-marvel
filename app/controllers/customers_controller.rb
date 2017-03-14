class CustomersController < ApplicationController

  def index
    
  end

  def new
    @customer = Customer.new
  end

  def update

  end

  def create
    customer_params= params.require(:customer).permit(:name, :customer_type, :document, :adress, :email, :contact_name, :phone_number, :state_registration, :vip)
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customer_path(@customer)
    else
      flash[:errors] = 'Não foi possivel cadastrar cliente.
                     Preencha os campos em branco.'
      render :new
    end
  end

 def show
  @customer = Customer.find(params[:id])
 end


end
