require_relative 'test_helper'

class TestFakerHobbit < Test::Unit::TestCase
  def setup
    @tester = Faker::Hobbit
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end

  def test_thorins_company
    assert @tester.thorins_company.match(/\w+/)
  end
end
