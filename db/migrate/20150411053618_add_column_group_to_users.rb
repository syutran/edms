class AddColumnGroupToUsers < ActiveRecord::Migration
  def change
    add_column :users, :group_id, :integer
    add_column :users, :status, :integer, :default => 0
  end
end
