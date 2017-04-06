class WeightsController < ApplicationController
  def show
    @weight = Ration.find(params[:id])
    @products = Product.all
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
      flash[:notice] = "saved"
      redirect_to root_path
    else
      flash.now[:alert] = "not saved"
      render :new
    end
  end

  def add_product_to_ration
    @products_in_list = ProductRation.new(products_in_list_params)
    if @products_in_list.save
      flash[:notice] = "Product added to list"
      redirect_to weight_path(params[:product_ration][:ration_id])
    else
      flash[:alert] = @products_in_list.errors.full_messages.join("")
      redirect_to weight_path(params[:product_ration][:ration_id])
    end
  end

  def remove_product_from_ration

  end

  private

  def weight_params
    params.require(:ration).permit(:my_weight)
  end

  def products_in_list_params
    params.require(:product_ration).permit(:product_id, :ration_id)
  end
end
