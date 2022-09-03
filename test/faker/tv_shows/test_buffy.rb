# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsBuffy < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Buffy
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end

  def test_actor
    assert_match @tester.actor, /\w+/
  end

  # deprecated
  def test_celebrity
    assert_match @tester.celebrity, /\w+/
  end

  def test_big_bad
    assert_match @tester.big_bad, /\w+/
  end

  def test_episode
    assert_match @tester.episode, /\w+/
  end
end
