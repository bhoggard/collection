require 'test_helper'

class ExhibitionsControllerTest < ActionController::TestCase
  test "should get show" do
    exhibition = exhibitions(:englishkills)
    get :show, id: exhibition
    assert_response :success
    assert_equal assigns(:exhibition), exhibition
  end
end
