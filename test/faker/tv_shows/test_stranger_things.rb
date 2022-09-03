# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsThings < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::StrangerThings
  end

  def test_characters
    assert_match @tester.character, /\w+/
  end

  def test_quotes
    assert_match @tester.quote, /\w+/
  end
end
