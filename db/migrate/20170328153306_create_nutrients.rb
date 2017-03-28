class CreateNutrients < ActiveRecord::Migration
  def change
    create_table :nutrients do |t|
      t.string :name
      t.integer :cal_per_gram
      t.integer :percents

      t.timestamps null: false
    end
  end
end
