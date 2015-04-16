class AddColumnCopyIdToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :copy_id, :integer
  end
end
