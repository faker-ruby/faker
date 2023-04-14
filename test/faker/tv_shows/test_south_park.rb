# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsSouthPark < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::SouthPark
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end

  def test_episode_name
    assert_match(/\w+/, @tester.episode_name)
  end
end
