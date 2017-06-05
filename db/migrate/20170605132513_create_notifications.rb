class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :subject, polymorphic: true
      t.boolean :read, default: false
      t.string :content

      t.timestamps
    end
  end
end
