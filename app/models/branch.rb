class Branch < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Branch'
  has_many :children, :class_name => 'Branch', :foreign_key => 'parent_id', :dependent => :destroy
  has_many :users
  has_many :devices

  before_create do
    if Branch.find_by_admin_id(self.admin_id).nil? then
      self.status=99
      self.user_id=self.admin_id
      self.parent_id = nil
    else
      self.status=1
      
    end
  end

  after_create do
    if self.status==99 then
      u=User.find(self.admin_id)
      u.branch_id=self.id
      u.status=99
      u.group_id=self.id
      u.save
    end
  end

end
