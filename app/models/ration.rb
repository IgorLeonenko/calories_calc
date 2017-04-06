class Ration < ActiveRecord::Base
  has_many :product_rations, dependent: :destroy
  has_many :products, through: :product_rations

  after_create :calculate_params

  private

  def calculate_params
    total_calories = self.my_weight * 26
    proteins = (total_calories / 100) * Nutrient.find_by_name("Protein").percents
    fat = (total_calories / 100) * Nutrient.find_by_name("Fat").percents
    carbohydrates = (total_calories / 100) * Nutrient.find_by_name("Carbohydrate").percents
    update_attribute(:total_calories, total_calories)
    update_attribute(:proteins, proteins)
    update_attribute(:fat, fat)
    update_attribute(:carbohydrates, carbohydrates)
  end
end
