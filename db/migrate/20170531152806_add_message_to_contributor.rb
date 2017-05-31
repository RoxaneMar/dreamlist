class AddMessageToContributor < ActiveRecord::Migration[5.0]
  def change
    add_column :contributors, :message, :text
  end
end
