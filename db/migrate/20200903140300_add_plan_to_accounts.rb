class AddPlanToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :plan, :string
  end
end
