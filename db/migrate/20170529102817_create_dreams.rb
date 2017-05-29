class CreateDreams < ActiveRecord::Migration[5.0]
  def change
    create_table :dreams do |t|
      t.string :title
      t.text :description
      t.float :goal_amount
      t.date :end_date
      t.boolean :reached
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
