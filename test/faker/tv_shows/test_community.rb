# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsCommunity < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Community
  end

  def test_character
    assert_match @tester.characters, /\w/
  end

  def test_quote
    assert_match @tester.quotes, /\w/
  end
end
