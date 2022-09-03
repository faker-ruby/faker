# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBackToTheFuture < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::BackToTheFuture
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_date
    assert_match @tester.date, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
