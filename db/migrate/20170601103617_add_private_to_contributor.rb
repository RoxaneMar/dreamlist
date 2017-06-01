class AddPrivateToContributor < ActiveRecord::Migration[5.0]
  def change
    change_column :kitties, :private, :boolean, default: false
  end
end
