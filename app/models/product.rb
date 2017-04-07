class Product < ActiveRecord::Base
  TYPES = %w(fat protein carbohydrate)

  validates :name, :calories_per_hundred_grams,
            :product_type, presence: { message: "Должно быть заполнено" }
  validates :calories_per_hundred_grams, numericality: { message: "Только цифры" }
  validates :product_type, inclusion: { in: TYPES, message: "Только из списка" }

  has_many :product_rations, dependent: :destroy
  has_many :rations, through: :product_rations

  scope :proteins, -> { where(product_type: "protein") }
  scope :carbohydrates, -> { where(product_type: "carbohydrate") }

  def self.carbs(ration_id)
    joins("INNER JOIN product_rations ON product_rations.product_id = products.id AND products.product_type = 'carbohydrate'")
    .where("product_rations.ration_id = ?", ration_id)
  end

  def self.prots(ration_id)
    joins("INNER JOIN product_rations ON product_rations.product_id = products.id AND products.product_type = 'protein'")
    .where("product_rations.ration_id = ?", ration_id)
  end
end
