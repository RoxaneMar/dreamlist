class Removedefaultvalueforgoalamountinkitties < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:kitties, :goal_amount_cents, nil)
  end
end
