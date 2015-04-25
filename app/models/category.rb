class Category < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Category'
  has_many :children, :class_name => 'Category', :foreign_key => 'parent_id', :dependent => :restrict_with_exception
  has_many :devices, :dependent => :restrict_with_exception #, :error => "不能删除含有子数据的分类！"
  validates_presence_of :name, :message => "分类名称不能为空！"

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
