class BudgetsController < ApplicationController

  def new
    @budget = Budget.new
  end

  def create
    budget_params = params.require(:budget).permit(:name, :contact_number, :email, :description)
    @budget = Budget.new(budget_params)
      if @budget.save
        redirect_to root_path
        flash[:alert] = 'Agradecemos seu interesse em breve entraremos em contato.'
      else
        flash[:error] = 'Preencha os campos em brancos'
        render :new  
      end
  end
end
