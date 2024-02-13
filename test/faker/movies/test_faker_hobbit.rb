# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMoviesHobbit < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::Hobbit
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_thorins_company
    assert_match(/\w+/, @tester.thorins_company)
  end
end
