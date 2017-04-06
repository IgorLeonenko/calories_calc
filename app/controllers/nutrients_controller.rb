class NutrientsController < ApplicationController
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

  def update; end

  def destroy

  end

  private

  def nutrient_params
    params.require(:nutrient).permit(:name, :cal_per_gram, :percents)
  end
end
