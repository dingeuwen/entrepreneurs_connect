class AddNewParametersToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :summary, :string
    add_column :ideas, :vision, :text
    add_column :ideas, :problem_statement, :text
    add_column :ideas, :details, :text
    add_column :ideas, :what_i_need, :text
    add_column :ideas, :private, :boolean
  end
end
