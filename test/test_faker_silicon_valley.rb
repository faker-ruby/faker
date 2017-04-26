require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerSiliconValley < Test::Unit::TestCase
  def setup
    @silicon_valley = Faker::SiliconValley
  end

  def test_character
    assert @silicon_valley.character.match(/\w+/)
  end

  def test_company
    assert @silicon_valley.company.match(/\w+/)
  end

  def test_quote
    assert @silicon_valley.quote.match(/\w+/)
  end
end
