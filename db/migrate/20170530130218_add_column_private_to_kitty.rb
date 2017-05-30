class AddColumnPrivateToKitty < ActiveRecord::Migration[5.0]
  def change
    add_column :kitties, :private, :boolean
  end
end
