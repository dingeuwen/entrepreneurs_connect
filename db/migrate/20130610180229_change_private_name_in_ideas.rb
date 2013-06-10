class ChangePrivateNameInIdeas < ActiveRecord::Migration
  def change
    change_table :ideas do |t|
      t.rename :private, :enable_private
    end
  end
end
