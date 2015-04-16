class DeviceImagesController < ApplicationController
  before_action :set_device_image, only: [:edit, :update, :destroy]

  # GET /device_images
  # GET /device_images.json
  def index
    @device_images = DeviceImage.all
  end

  # GET /device_images/1
  # GET /device_images/1.json
  def show
    if DeviceImage.find_by_device_id(params[:id]).nil?
      redirect_to new_device_image_path(params[:id])
    else
      @device_image = DeviceImage.find_by_device_id(params[:id])
    end
  end

  # GET /device_images/new
  def new
    @device_image = DeviceImage.new
    @device_image.device_id = params[:id]
  end

  # GET /device_images/1/edit
  def edit

  end

  # POST /device_images
  # POST /device_images.json
  def create
    @device_image = DeviceImage.new(device_image_params)

    respond_to do |format|
      if @device_image.save
        format.html { redirect_to @device_image, notice: 'Device image was successfully created.' }
        format.json { render :show, status: :created, location: @device_image }
      else
        format.html { render :new }
        format.json { render json: @device_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /device_images/1
  # PATCH/PUT /device_images/1.json
  def update
    respond_to do |format|
     @device_image = DeviceImage.find_by_device_id(device_image_params[:device_id] )
      if @device_image.update(device_image_params)
        format.html { redirect_to @device_image, notice: 'Device image was successfully updated.' }
        format.json { render :show, status: :ok, location: @device_image }
      else
        format.html { render :edit }
        format.json { render json: @device_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_images/1
  # DELETE /device_images/1.json
  def destroy
    @device_image.destroy
    respond_to do |format|
      format.html { redirect_to device_images_url, notice: 'Device image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_image
      @device_image = DeviceImage.find_by_device_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_image_params
      params.require(:device_image).permit(:device_id, :face, :tag, :feature, :inward, :external, :other_side, :agreement, :receipt)
    end
end
