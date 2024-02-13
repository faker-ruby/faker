# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsHowIMetYourMother < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::HowIMetYourMother
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_catch_phrase
    assert_match(/\w+/, @tester.catch_phrase)
  end

  def test_high_five
    assert_match(/\w+/, @tester.high_five)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
