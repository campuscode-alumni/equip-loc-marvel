class EquipmentTypesController < ApplicationController
  def new
    @equipment_type = EquipmentType.new
  end

  def create
    @equipment_type = EquipmentType.new(equipment_type_params)
    if @equipment_type.save
      redirect_to @equipment_type
    else
      flash[:errors] = 'Não foi possível cadastrar tipo de equipamento.'
      render 'new'
    end
  end

  def show
    @equipment_type = EquipmentType.find(params[:id])
  end

  private
  def equipment_type_params
    params.require(:equipment_type).permit(:name)
  end
end
