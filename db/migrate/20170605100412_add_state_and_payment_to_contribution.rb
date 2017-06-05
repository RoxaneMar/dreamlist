class AddStateAndPaymentToContribution < ActiveRecord::Migration[5.0]
  def change
    add_column :contributors, :state, :string
    add_column :contributors, :payment, :json
  end
end
