class AddTotalCaloriesToRation < ActiveRecord::Migration
  def change
    add_column :rations, :total_calories, :integer
  end
end
