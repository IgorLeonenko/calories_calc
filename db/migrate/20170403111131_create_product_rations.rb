class CreateProductRations < ActiveRecord::Migration
  def change
    create_table :product_rations do |t|
      t.integer :ration_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
