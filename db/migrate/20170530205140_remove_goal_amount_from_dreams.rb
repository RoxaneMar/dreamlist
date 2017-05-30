class RemoveGoalAmountFromDreams < ActiveRecord::Migration[5.0]
  def change
    remove_column :dreams, :goal_amount, :float
  end
end
