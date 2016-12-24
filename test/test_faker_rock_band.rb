require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerRockBand < Test::Unit::TestCase
  def setup
    @tester = Faker::RockBand
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end

end