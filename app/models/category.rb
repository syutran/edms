class Category < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Category'
  has_many :children, :class_name => 'Category', :foreign_key => 'parent_id', :dependent => :destroy

  before_create do
    if self.parent_id == 0 then
      self.level = 0
    else
      self.level = 1
    end

  end
  after_create do

  end

end
