require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_equal([], assigns(:artists).to_a)
  end

  test "should filter by letters" do
    james_and_isolde = [artists(:james), artists(:isolde)]
    get :index, letters: 'wxyz'
    assert_response :success
    assert_equal james_and_isolde, assigns(:artists).to_a
  end
end
