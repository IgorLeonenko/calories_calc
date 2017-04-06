class ProductRation < ActiveRecord::Base
  belongs_to :product
  belongs_to :ration

  validates :product_id, uniqueness: { scope: :ration_id, message: "already in ration" }
end
