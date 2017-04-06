module WeightsHelper
  def food_per_day(weight, product)
    ((weight.to_f / 4) / product.calories_per_hundred_grams.to_f * 100).to_i
  end

  def food_per_one_time(weight, product)
    (((weight.to_f / 4) / product.calories_per_hundred_grams.to_f * 100).to_i) / 6
  end
end
