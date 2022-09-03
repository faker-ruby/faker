# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsBojackHorseman < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::BojackHorseman
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_tongue_twister
    assert_match @tester.tongue_twister, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
