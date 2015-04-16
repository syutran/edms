require 'test_helper'

class DevicesControllerTest < ActionController::TestCase
  setup do
    @device = devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device" do
    assert_difference('Device.count') do
      post :create, device: { branch_id: @device.branch_id, brand: @device.brand, brand_type: @device.brand_type, category_id: @device.category_id, external_config: @device.external_config, face: @device.face, fix: @device.fix, guaranteed: @device.guaranteed, inward_config: @device.inward_config, member: @device.member, purchase: @device.purchase, purpose: @device.purpose, reject: @device.reject, serial_number: @device.serial_number, status: @device.status, used: @device.used }
    end

    assert_redirected_to device_path(assigns(:device))
  end

  test "should show device" do
    get :show, id: @device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device
    assert_response :success
  end

  test "should update device" do
    patch :update, id: @device, device: { branch_id: @device.branch_id, brand: @device.brand, brand_type: @device.brand_type, category_id: @device.category_id, external_config: @device.external_config, face: @device.face, fix: @device.fix, guaranteed: @device.guaranteed, inward_config: @device.inward_config, member: @device.member, purchase: @device.purchase, purpose: @device.purpose, reject: @device.reject, serial_number: @device.serial_number, status: @device.status, used: @device.used }
    assert_redirected_to device_path(assigns(:device))
  end

  test "should destroy device" do
    assert_difference('Device.count', -1) do
      delete :destroy, id: @device
    end

    assert_redirected_to devices_path
  end
end
