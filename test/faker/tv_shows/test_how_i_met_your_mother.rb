# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsHowIMetYourMother < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::HowIMetYourMother
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_catch_phrase
    assert_match @tester.catch_phrase, /\w+/
  end

  def test_high_five
    assert_match @tester.high_five, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
