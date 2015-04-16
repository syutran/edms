class DeviceImage < ActiveRecord::Base
    has_attached_file  :face, :styles => { :original => "600x450", :medium => "300x300", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    has_attached_file  :tag, :styles => { :original => "600x450", :medium => "300x300", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    has_attached_file  :feature, :styles => { :original => "600x450",  :medium => "300x300", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    has_attached_file  :inward, :styles => { :original => "600x450",  :medium => "300x300", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    has_attached_file  :external, :styles => { :original => "600x450", :medium => "300x300", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    has_attached_file  :other_side, :styles => { :original => "600x450", :medium => "300x300", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    has_attached_file  :agreement, :styles => { :original => "600x450", :medium => "300x300", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    has_attached_file  :receipt, :styles => { :original => "600x450", :medium => "300x300", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :face, :content_type => /\Aimage\/.*\Z/
    validates_attachment_content_type :tag, :content_type => /\Aimage\/.*\Z/
    validates_attachment_content_type :feature, :content_type => /\Aimage\/.*\Z/
    validates_attachment_content_type :inward, :content_type => /\Aimage\/.*\Z/
    validates_attachment_content_type :external, :content_type => /\Aimage\/.*\Z/
    validates_attachment_content_type :other_side, :content_type => /\Aimage\/.*\Z/
    validates_attachment_content_type :agreement, :content_type => /\Aimage\/.*\Z/
    validates_attachment_content_type :receipt, :content_type => /\Aimage\/.*\Z/
  belongs_to :device
end
