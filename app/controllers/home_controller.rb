class HomeController < ApplicationController

  def index
    @contracts = Contract.all
    if @contracts.empty?
      flash[:empty] = 'Não há nenhum contrato cadastrado'
    end
    @near_end_contracts = @contracts.where(
      "end_date <= :two_days", {two_days: Time.zone.today.days_since(2).to_s}
    ).limit(5)
  end

end
