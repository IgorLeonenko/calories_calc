class WeightsController < ApplicationController
  before_action :set_weight, only: [:show, :destroy, :remove_product_from_ration]

  def show
    @products_proteins = Product.proteins
    @products_carbohydrates = Product.carbohydrates
    @products_in_list = ProductRation.new
    @carbohydrates = Product.carbs(params[:id])
    @proteins = Product.prots(params[:id])
  end

  def new
    @weight = Ration.new
  end

  def create
    @weight = Ration.new(weight_params)
    if @weight.save
      flash[:notice] = "Сохранено удачно"
      redirect_to root_path
    else
      flash.now[:alert] = "Не сохранено"
      render :new
    end
  end

  def add_product_to_ration
    @products_in_list = ProductRation.new(products_in_list_params)
    if @products_in_list.save
      flash[:notice] = "Продукт доавлен в список"
      redirect_to weight_path(params[:product_ration][:ration_id])
    else
      flash[:alert] = @products_in_list.errors.get(:product_id).join("")
      redirect_to weight_path(params[:product_ration][:ration_id])
    end
  end

  def remove_product_from_ration
    product_in_ration = ProductRation.find_by_product_id_and_ration_id(
      params[:product_id], @weight.id
    )
    product_in_ration.destroy
    flash[:notice] = "Продукт удален из списка"
    redirect_to weight_path
  end

  def destroy
    @weight.destroy
    flash[:notice] = "Значение удалено"
    redirect_to root_path
  end

  private

  def set_weight
    @weight = Ration.find(params[:id])
  end

  def weight_params
    params.require(:ration).permit(:my_weight)
  end

  def products_in_list_params
    params.require(:product_ration).permit(:product_id, :ration_id)
  end
end
