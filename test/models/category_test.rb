require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "validity" do
    assert categories(:painting).valid?
    assert categories(:drawing).valid?
  end
end
