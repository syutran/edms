class CreateDeviceImages < ActiveRecord::Migration
  def change
    create_table :device_images do |t|
      t.integer :device_id

      t.timestamps null: false
    end
  end
end
