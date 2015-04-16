class ChangeBranchIdFormatInUsers < ActiveRecord::Migration
  def change
    change_column :users, :branch_id, :integer
  end
end
