class AddRulesAgreedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rules_agreed, :boolean, default: false
  end
end
