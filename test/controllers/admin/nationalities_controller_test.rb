require 'test_helper'

module Admin
  class NationalitiesControllerTest < ActionController::TestCase
    setup do
      @nationality = nationalities(:us)
    end

    test "index should require login" do
      get :index
      assert_response 302
      assert_redirected_to login_path
    end
  end
end
