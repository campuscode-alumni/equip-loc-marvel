class HomeController < ApplicationController

  def index
    @contracts = Contract.all
    if @contracts.empty?
      flash[:empty] = 'Não há nenhum contrato cadastrado'
    end
  end

end
