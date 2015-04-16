class AddColumnImageToDeviceImages < ActiveRecord::Migration
  def change
    add_attachment :device_images, :face
    add_attachment :device_images, :tag
    add_attachment :device_images, :feature
    add_attachment :device_images, :inward
    add_attachment :device_images, :external
    add_attachment :device_images, :other_side
    add_attachment :device_images, :agreement
    add_attachment :device_images, :receipt
  end
end
