require 'test_helper'

module Admin
  class ArtistsControllerTest < ActionController::TestCase
    test "index should require login" do
      get :index
      assert_response 302
      assert_redirected_to login_path
    end
  end
end
