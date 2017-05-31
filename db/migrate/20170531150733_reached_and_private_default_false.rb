class ReachedAndPrivateDefaultFalse < ActiveRecord::Migration[5.0]
  def change
    change_column :dreams, :reached, :boolean, default: false
    change_column :kitties, :private, :boolean, default: false
  end
end
