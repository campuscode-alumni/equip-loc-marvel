class HomeController < ApplicationController

  def index
    @contracts = Contract.all
    if @contracts.empty?
      flash[:empty] = 'Não há nenhum contrato cadastrado'
    end
    @contracts_end_today = Contract.where(end_date: Time.zone.today)
    if @contracts_end_today.empty?
      flash[:empty_today] = 'Sem contratos vencendo hoje.'
    end
  end


end
