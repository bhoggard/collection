require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid model' do
    assert users(:barry).valid?
  end

  test 'authentication' do
    assert users(:barry).authenticate('password')
  end
end
