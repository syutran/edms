module ApplicationHelper
  def sub_categories
    categories=Category.where("branch_id = ? and level = 0", current_user.group_id)
    subcategories = [["分类列表",0]]
    categories.each do |c|
      subcategories += c.children.collect{|ca|[c.name+">>"+ca.name,ca.id]}
    end
    subcategories
  end
  def category_id_to_name(id)
    Category.find(id).parent.name+"["+Category.find(id).name+"]"
  end
  def branch_id_to_name(id)
    Branch.find(id).branchname
  end
  def device_status_to_string(status)
    to_string = ""
    case status
      when 1 then
      to_string = "新增"
      when 2,12 then
        to_string = "变更"
      when 11 then
        to_string = "正常"
      else
        to_string = "不正常"
    end
  end

  def title(page_title)
    content_for(:title) { page_title}
  end

  def flash_notifications
    message = flash[:error] || flash[:notice]
    if message
      type = flash.keys[0].to_s
      javascript_tag %Q{$.notification({ message:"#{message}", type:"#{type}" });}
    end
  end
end
