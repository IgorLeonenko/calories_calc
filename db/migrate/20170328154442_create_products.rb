class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :calories_per_hundred_grams

      t.timestamps null: false
    end
  end
end
