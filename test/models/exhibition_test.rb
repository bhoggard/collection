require 'test_helper'

class ExhibitionTest < ActiveSupport::TestCase
  test "validity" do
    assert exhibitions(:englishkills).valid?
  end
end
