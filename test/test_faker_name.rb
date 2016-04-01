require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerName < Test::Unit::TestCase

  def setup
    @tester = Faker::Name
  end

  def test_name
    assert @tester.name.match(/(\w+\.? ?){2,3}/)
  end

  def test_prefix
    assert @tester.prefix.match(/[A-Z][a-z]+\.?/)
  end

  def test_suffix
    assert @tester.suffix.match(/[A-Z][a-z]*\.?/)
  end

  def test_game_of_thrones 
    assert @tester.game_of_thrones.match(/([A-z][a-z]\s*)+/)
  end
end
