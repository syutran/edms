class AddColumnGroupIdToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :group_id, :integer
  end
end
