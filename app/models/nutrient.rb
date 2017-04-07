class Nutrient < ActiveRecord::Base
  validates :name, :cal_per_gram, :percents, presence: { message: "Должно быть заполнено" }
  validates :cal_per_gram, :percents, numericality: { messsage: "Только цифры" }
end
