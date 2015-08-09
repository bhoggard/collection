require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  test "validity" do
    assert artists(:james).valid?
    assert artists(:isolde).valid?
  end

  test "finding by letters" do
    assert Artist.by_letters('abc').empty?
    assert_equal [artists(:barry)], Artist.by_letters('ghij').to_a
    james_and_isolde = [artists(:james), artists(:isolde)]
    assert_equal james_and_isolde, Artist.by_letters('wxyz').to_a
  end

  test "featured_work" do
    assert_equal works(:photo), artists(:james).featured_work
  end
end
