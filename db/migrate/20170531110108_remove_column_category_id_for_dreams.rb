class RemoveColumnCategoryIdForDreams < ActiveRecord::Migration[5.0]
  def change
    remove_column :dreams, :category_id, :integer
  end
end
