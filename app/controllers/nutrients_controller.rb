class NutrientsController < ApplicationController
  before_action :set_nutrient, only: [:show, :edit, :update, :destroy]

  def index
    @nutrients = Nutrient.all
  end

  def new
    @nutrient = Nutrient.new
  end

  def create
    @nutrient = Nutrient.new(nutrient_params)
    if @nutrient.save
      flash[:notice] = "Saved"
      redirect_to nutrients_path
    else
      flash.now[:alert] = "Not saved"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @nutrient.update(nutrient_params)
      flash[:notice] = "Updated"
      redirect_to nutrients_path
    else
      flash.now[:alert] = "Wrong"
      render :edit
    end
  end

  def destroy
    @nutrient.destroy
    flash[:notice] = "Deleted"
    redirect_to nutrients_path
  end

  private

  def set_nutrient
    @nutrient = Nutrient.find(params[:id])
  end

  def nutrient_params
    params.require(:nutrient).permit(:name, :cal_per_gram, :percents)
  end
end
