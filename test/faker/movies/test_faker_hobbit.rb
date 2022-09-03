# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMoviesHobbit < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::Hobbit
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end

  def test_location
    assert_match @tester.location, /\w+/
  end

  def test_thorins_company
    assert_match @tester.thorins_company, /\w+/
  end
end
