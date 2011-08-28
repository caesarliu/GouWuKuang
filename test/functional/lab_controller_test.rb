require 'test_helper'

class LabControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
