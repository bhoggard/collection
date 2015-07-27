require 'test_helper'

class WorksControllerTest < ActionController::TestCase
  test "should get show" do
    work = works(:photo)
    get :show, id: work
    assert_response :success
    assert_equal work, assigns(:work)
  end

  test "should get acquire" do
    get :acquire
    assert_response :success
  end

  test "should get featured" do
    get :featured
    assert_response :success
    refute_nil assigns(:works)
  end

  test "should get recent" do
    get :recent
    assert_response :success
  end
end
