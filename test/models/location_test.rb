require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "validity" do
    assert locations(:flatfiles).valid?
    assert locations(:livingroom).valid?
  end
end
