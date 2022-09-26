# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsCommunity < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Community
  end

  def test_character
    assert_match(/\w/, @tester.characters)
  end

  def test_quote
    assert_match(/\w/, @tester.quotes)
  end
end
