require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  test "validity" do
    assert artists(:james).valid?
    assert artists(:isolde).valid?
  end
end
