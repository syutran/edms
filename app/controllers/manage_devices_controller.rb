class ManageDevicesController < ApplicationController
  # before_action current_user.status == 99 # 只允许管理员进入
  before_action :set_branch, only: [:branch_devices]
  @branch
  def index
    @changed_devices=Device.where("status = 2 and group_id = ?", current_user.group_id) 
    @new_devices=Device.where("status = 1 and group_id = ?", current_user.group_id) 
    @branches = current_user.branch.children.order(:coding)
  end

  def newed
    @new_device = Device.find(params[:id])
  end
  
  def change
    @change_device = Device.find(params[:id])
    @source_device = Device.find(@change_device.copy_id)
  end

  def pass_newed
    @new_device = Device.find(params[:id]) 
    @new_device.status = 11

    respond_to do |format|
      if @new_device.save
        format.html { redirect_to manage_index_path, notice: '已成功确认！' }
      else
        format.html { render :index, notice: '确认失败！' }
      end
    end
  end

  def pass_change
    @change_device = Device.find(params[:id])
    @source_device = Device.find(@change_device.copy_id)
    @source_device.category_id = @change_device.category_id
    @source_device.brand = @change_device.brand
    @source_device.brand_type = @change_device.brand_type
    @source_device.serial_number = @change_device.serial_number
    @source_device.inward_config = @change_device.inward_config
    @source_device.external_config = @change_device.external_config
    @source_device.member = @change_device.member
    @source_device.purpose = @change_device.purpose
    @source_device.fix = @change_device.fix
    @source_device.purchase = @change_device.purchase
    @source_device.used = @change_device.used
    @source_device.guaranteed = @change_device.guaranteed
    @source_device.reject = @change_device.reject
    @source_device.copy_id = nil
    @source_device.status = 11
    @change_device.destroy
    respond_to do |format|
      if @source_device.save
        @change_device.destroy
        format.html { redirect_to manage_index_path, notice: '已成功确认！' }
      else
        format.html { render :index, notice: '确认失败！' }
      end
    end
  end

  def branch_devices
    # @branch = params[:branch_id]
    if params[:mode]=="1"
      @branch_devices = Device.where("status > 10 and branch_id = ?", params[:branch_id]).order("category_id")
      @branch_devices_groups=@branch_devices.group_by{|g| g.category}
      @mode = 1

    else
      @branch_devices = Device.where("status > 10 and branch_id = ?", params[:branch_id]).order("member")
      @order = "member"
    end
  end
  def show
    @device = Device.find(params[:id])
  end

  private
  
  def set_branch
    @branch = Branch.find(params[:branch_id])
  end
end
