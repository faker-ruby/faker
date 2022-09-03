# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsBreakingBad < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::BreakingBad
  end

  def test_character
    10.times { assert_match @tester.character, /\w+/ }
  end

  def test_episode
    10.times { assert_match @tester.episode, /\w+/ }
  end
end
