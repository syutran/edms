class ChangeColumnNameAdminIdToBranch < ActiveRecord::Migration
  def change
    rename_column :branches, :admin_id, :group_id

  end
end
