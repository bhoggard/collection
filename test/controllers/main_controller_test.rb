require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert assigns(:work)
  end

  test "should get installation" do
    get :installation
    assert_response :success
    assert assigns(:images)
    assert assigns(:image)
    assert assigns(:next)
  end
end
