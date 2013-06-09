class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :countries, :string
    add_column :users, :undergrad, :string
    add_column :users, :role_interest, :string
    add_column :users, :industry_interest, :string
    add_column :users, :skills, :string
    add_column :users, :entrepreneurship_goals, :text
    add_column :users, :views, :integer, :default => 0
    add_column :users, :background, :text
    add_column :users, :employment_history, :text
  end
end
