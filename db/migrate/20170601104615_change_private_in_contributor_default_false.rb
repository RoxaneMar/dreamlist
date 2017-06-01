class ChangePrivateInContributorDefaultFalse < ActiveRecord::Migration[5.0]
  def change
    change_column :contributors, :private, :boolean, default: false
  end
end
