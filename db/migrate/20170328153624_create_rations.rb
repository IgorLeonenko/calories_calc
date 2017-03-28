class CreateRations < ActiveRecord::Migration
  def change
    create_table :rations do |t|
      t.decimal :my_weight
      t.integer :proteins
      t.integer :carbohydrates
      t.integer :fat

      t.timestamps null: false
    end
  end
end
