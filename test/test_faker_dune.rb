require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerDune < Test::Unit::TestCase
  def setup
    @tester = Faker::Dune
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_title
    assert @tester.title.match(/\w+/)
  end

  def test_planet
    assert @tester.planet.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  # test good match
  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  # test error on no match
  def test_saying
    assert @tester.saying.match(/\w+/)
  end

  # test good match
  def test_saying
    assert @tester.saying.match(/\w+/)
  end

  # test error on no match
  def test_saying
    assert @tester.saying.match(/\w+/)
  end

end
