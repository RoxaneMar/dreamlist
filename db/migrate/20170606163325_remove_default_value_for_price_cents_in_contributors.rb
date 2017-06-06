class RemoveDefaultValueForPriceCentsInContributors < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:contributors, :price_cents, nil)
  end
end
