require 'test_helper'

class DeviceImagesControllerTest < ActionController::TestCase
  setup do
    @device_image = device_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:device_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device_image" do
    assert_difference('DeviceImage.count') do
      post :create, device_image: { device_id: @device_image.device_id }
    end

    assert_redirected_to device_image_path(assigns(:device_image))
  end

  test "should show device_image" do
    get :show, id: @device_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device_image
    assert_response :success
  end

  test "should update device_image" do
    patch :update, id: @device_image, device_image: { device_id: @device_image.device_id }
    assert_redirected_to device_image_path(assigns(:device_image))
  end

  test "should destroy device_image" do
    assert_difference('DeviceImage.count', -1) do
      delete :destroy, id: @device_image
    end

    assert_redirected_to device_images_path
  end
end
