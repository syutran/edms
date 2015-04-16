class AddColumnAddressToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :network_address, :string
    add_column :devices, :installation_address, :string
    add_column :devices, :remarks, :text
  end
end
