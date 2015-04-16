class AddColumnAdminIdToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :admin_id, :integer
    add_column :branches, :user_id, :integer
  end
end
