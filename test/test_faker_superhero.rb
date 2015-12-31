require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerSuperhero < Test::Unit::TestCase

  def setup
    @tester = Faker::Superhero
  end

  def test_power
    assert @tester.power.match(/\w+\.?/)
  end
end
