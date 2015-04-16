class AddAttachmentFaceTagFeatureInwardExternalOtherSideAgreementReceiptToDeviceImages < ActiveRecord::Migration
  def self.up
    change_table :device_images do |t|
      #t.attachment :face
      #t.attachment :tag
      #t.attachment :feature
      #t.attachment :inward
      #t.attachment :external
      #t.attachment :other_side
      #t.attachment :agreement
      #t.attachment :receipt
    end
  end

  def self.down
    remove_attachment :device_images, :face
    remove_attachment :device_images, :tag
    remove_attachment :device_images, :feature
    remove_attachment :device_images, :inward
    remove_attachment :device_images, :external
    remove_attachment :device_images, :other_side
    remove_attachment :device_images, :agreement
    remove_attachment :device_images, :receipt
  end
end
