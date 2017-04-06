class HomeController < ApplicationController
  def index
    @nutrients = Nutrient.all
    @weights = Ration.all
  end
end
