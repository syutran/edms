class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.where("branch_id = ? and status < 12", current_user.branch_id).order("category_id")
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
    @device.status = 1
    @device.group_id = current_user.group_id
    @device.branch_id = current_user.branch_id
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    if @device.status < 10 then
      respond_to do |format|
      if @device.update(device_params)

        format.html { redirect_to @device, notice: '设备已重新编辑！' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
      end
    else
      @source_device = Device.find(params[:id])
      @device_copy=Device.new(device_params)
      @device_copy.copy_id = @source_device.id
      @device_copy.status = 2
      @device_copy.save
      @source_device.update(:status => 12)
      respond_to do |format|
        format.html { redirect_to @device_copy, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device_copy }
    end
  end
end

# DELETE /devices/1
# DELETE /devices/1.json
def destroy
  @device.destroy
  respond_to do |format|
    format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_device
  @device = Device.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def device_params
  params.require(:device).permit(:category_id, :brand, :brand_type, :serial_number, :inward_config, :external_config, :branch_id, :member, :purpose, :fix, :purchase, :used, :guaranteed, :reject, :status, :face, :copy_id, :group_id, :network_address, :installation_address, :remarks)
end
end
