class AddPriceToKittyAndContributions < ActiveRecord::Migration[5.0]
  def change
    remove_column :kitties, :goal_amount, :float
    add_monetize :kitties, :goal_amount, currency: { present: false}
    remove_column :contributors, :amount, :float
    add_monetize :contributors, :price, currency: { present: false}
  end
end
