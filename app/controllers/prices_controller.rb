class PricesController < ApplicationController

  def new
    @price = Price.new
  end

  def create
    @price = Price.new(params.require(:price).permit(:rental_period,
    :equipment_type_id, :price))
    if @price.save
      redirect_to @price
    else
      flash[:notice] = 'Não foi possível cadastrar o preço'
      render 'new'
    end
  end

  def show
    @price = Price.find(params[:id])
  end

end
