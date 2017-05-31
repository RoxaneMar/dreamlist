class AddColumnCategoriesToDreams < ActiveRecord::Migration[5.0]
  def change
    add_column :dreams, :category, :string
  end
end
