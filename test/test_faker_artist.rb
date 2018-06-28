require_relative 'test_helper'

class TestFakerArtist < Test::Unit::TestCase
  def setup
    @tester = Faker::Artist
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end
end
