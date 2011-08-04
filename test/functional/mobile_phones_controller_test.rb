require 'test_helper'

class MobilePhonesControllerTest < ActionController::TestCase
  setup do
    @mobile_phone = mobile_phones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mobile_phones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mobile_phone" do
    assert_difference('MobilePhone.count') do
      post :create, :mobile_phone => @mobile_phone.attributes
    end

    assert_redirected_to mobile_phone_path(assigns(:mobile_phone))
  end

  test "should show mobile_phone" do
    get :show, :id => @mobile_phone.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mobile_phone.to_param
    assert_response :success
  end

  test "should update mobile_phone" do
    put :update, :id => @mobile_phone.to_param, :mobile_phone => @mobile_phone.attributes
    assert_redirected_to mobile_phone_path(assigns(:mobile_phone))
  end

  test "should destroy mobile_phone" do
    assert_difference('MobilePhone.count', -1) do
      delete :destroy, :id => @mobile_phone.to_param
    end

    assert_redirected_to mobile_phones_path
  end
end
