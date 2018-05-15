require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerAncient < Test::Unit::TestCase
  def setup
    @tester = Faker::Ancient
  end

  def test_god
    assert @tester.god.match(/\w+/)
  end

  def test_primordial
    assert @tester.primordial.match(/\w+/)
  end

  def test_titan
    assert @tester.titan.match(/\w+/)
  end

  def test_hero
    assert @tester.hero.match(/\w+/)
  end
end
