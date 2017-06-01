class Contributor < ActiveRecord::Migration[5.0]
  def change
    add_column :contributors, :private, :boolean
  end
end
