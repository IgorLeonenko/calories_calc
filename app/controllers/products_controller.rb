class ProductsController < ApplicationController
  def index
    @products = Product.all.order("product_type ASC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "saved"
      redirect_to products_path
    else
      flash.now[:alert] = "not saved"
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy

  end

  private

  def product_params
    params.require(:product).permit(:name, :calories_per_hundred_grams, :product_type)
  end
end
