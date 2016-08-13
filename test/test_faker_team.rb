require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerTeam < Test::Unit::TestCase

  def setup
    @tester = Faker::Team
  end

  def test_name
    assert @tester.name.match(/(\w+\.? ?){2}/)
  end

  def test_creature
    assert @tester.creature.match(/(\w+){1}/)
  end

  def test_state
    assert @tester.state.match(/(\w+){1}/)
  end

  def test_sport
    assert @tester.sport.match(/(\w+){1}/)
  end

end
