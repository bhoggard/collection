require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact_params = {
      email: 'me@example.com',
      message: 'Please check out my art!',
      name: 'Kim Moore'
    }
    ActionMailer::Base.deliveries.clear
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    post :create, contact: @contact_params
    assert_redirected_to pages_contact_url
    assert assigns(:contact)
    assert_not ActionMailer::Base.deliveries.empty?
  end

  test "fails to send if nickname is filled in" do
    params = @contact_params.merge(nickname: 'i am a spambot')
    post :create, contact: params
    assert_redirected_to pages_contact_url
    assert ActionMailer::Base.deliveries.empty?
  end
end
