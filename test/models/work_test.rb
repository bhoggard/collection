require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  test "validity" do
    assert works(:photo).valid?
  end
end
