class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all.order("product_type ASC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Сохранено удачно"
      redirect_to products_path
    else
      flash.now[:alert] = "Не сохранено"
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      flash[:notice] = "Значение обновлено"
      redirect_to products_path
    else
      flash.now[:alert] = "Не обновлено"
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Значение удалено"
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :calories_per_hundred_grams, :product_type)
  end
end
