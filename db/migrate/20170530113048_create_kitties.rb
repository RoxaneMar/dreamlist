class CreateKitties < ActiveRecord::Migration[5.0]
  def change
    create_table :kitties do |t|
      t.references :dream, foreign_key: true
      t.float :goal_amount

      t.timestamps
    end
  end
end
