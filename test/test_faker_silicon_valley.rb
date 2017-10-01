require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class TestFakerSiliconValley < Test::Unit::TestCase
  def setup
    @tester = Faker::SiliconValley
  end

  def test_characters
    assert @tester.character.match(/\w+/)
  end

  def test_companies
    assert @tester.company.match(/\w+/)
  end

  def test_quotes
    assert @tester.quote.match(/\w+/)
  end
end
