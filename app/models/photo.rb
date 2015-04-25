class Photo < ActiveRecord::Base
    has_attached_file  :image, :styles => { :original => "600x450#", :medium => "300x300#", :thumb => "80x80#" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    belongs_to :device
end
