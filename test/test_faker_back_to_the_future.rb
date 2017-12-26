require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerBackToTheFuture < Test::Unit::TestCase
  def setup
    @tester = Faker::BackToTheFuture
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_date
    assert @tester.date.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
