require 'test_helper'

class NationalityTest < ActiveSupport::TestCase
  test "validity" do
    assert nationalities(:us).valid?
    assert nationalities(:de).valid?
  end
end
