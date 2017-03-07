class EquipmentController < ApplicationController

  def new
    @equipment = Equipment.new
    @equipment_types = EquipmentType.all
  end

  def create
    @equipment = Equipment.new(params.require(:equipment).permit(:name,
    :description, :serial_number, :acquisition_value, :acquisition_date,
    :shelf_life, :picture, :equipment_type_id, :manufacture, :vendor))

    if @equipment.save
      redirect_to @equipment
    else
      @equipment_types = EquipmentType.all
      flash[:notice] = 'Não foi possível cadastrar o equipamento'
      render 'new'
    end

  end

  def show
    @equipment = Equipment.find(params[:id])
  end

end
