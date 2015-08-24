require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get copyright" do
    get :copyright
    assert_response :success
  end

  test "should get dmca" do
    get :dmca
    assert_response :success
  end

  test "should get statistics" do
    get :statistics
    assert_response :success
  end

  test "should get press" do
    get :press
    assert_response :success
  end
end
