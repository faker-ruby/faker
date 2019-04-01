require_relative 'test_helper'

class TestFakerRockBand < Test::Unit::TestCase
  def setup
    @tester = Faker::RockBand
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end
end
