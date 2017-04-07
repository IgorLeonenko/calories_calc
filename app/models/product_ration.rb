class ProductRation < ActiveRecord::Base
  belongs_to :product
  belongs_to :ration

  validates :product_id, uniqueness: { scope: :ration_id, message: "Уже добавлен" }
  validates :product_id, :ration_id, presence: { message: "Выберите продукт" }
end
