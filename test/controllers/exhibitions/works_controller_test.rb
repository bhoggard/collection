require 'test_helper'

module Exhibitions
  class WorksControllerTest < ActionController::TestCase
    test "should get show" do
      exhibition = exhibitions(:englishkills)
      get :show, exhibition_id: exhibition
      assert_response :success
      assert_equal assigns(:exhibition), exhibition
      assert_equal assigns(:work), exhibition.works.first
    end
  end
end
