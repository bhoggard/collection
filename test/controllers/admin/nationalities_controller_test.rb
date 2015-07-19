require 'test_helper'

module Admin
  class NationalitiesControllerTest < ActionController::TestCase
    setup do
      @nationality = nationalities(:us)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:nationalities)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create nationality" do
      assert_difference('Nationality.count') do
        post :create, nationality: { name: 'Ostrobothnia' }
      end

      assert_redirected_to admin_nationality_path(assigns(:nationality))
    end

    test "should show nationality" do
      get :show, id: @nationality
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @nationality
      assert_response :success
    end

    test "should update nationality" do
      patch :update, id: @nationality, nationality: { name: 'Ostrobothnia' }
      assert_redirected_to admin_nationality_path(assigns(:nationality))
    end

    test "should destroy nationality" do
      assert_difference('Nationality.count', -1) do
        delete :destroy, id: @nationality
      end

      assert_redirected_to admin_nationalities_path
    end
  end
end
