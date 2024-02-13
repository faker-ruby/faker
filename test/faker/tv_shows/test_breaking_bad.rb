# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsBreakingBad < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::BreakingBad
  end

  def test_character
    deterministically_verify(-> { @tester.character }, depth: 4) { |result| assert_match(/\w+/, result) }
  end

  def test_episode
    deterministically_verify(-> { @tester.episode }, depth: 4) { |result| assert_match(/\w+/, result) }
  end
end
