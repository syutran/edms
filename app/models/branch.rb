class Branch < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Branch'
  has_many :children, :class_name => 'Branch', :foreign_key => 'parent_id', :dependent => :restrict_with_exception
  has_many :users
  has_many :devices, :dependent => :restrict_with_exception

  before_destroy do
    if self.status == 99
      return false
    end
  end

  before_create do
    if self.group_id.blank? then
      self.status=99
      self.parent_id = nil
    else
      self.status=1
    end
  end

  after_create do
    if self.status==99 then
      u=User.find(self.user_id)
      u.branch_id=self.id
      u.status=99
      u.group_id=self.id
      u.save
    end
  end

end
