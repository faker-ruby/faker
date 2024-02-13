# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsBuffy < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Buffy
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end

  def test_actor
    assert_match(/\w+/, @tester.actor)
  end

  # deprecated
  def test_celebrity
    assert_match(/\w+/, @tester.celebrity)
  end

  def test_big_bad
    assert_match(/\w+/, @tester.big_bad)
  end

  def test_episode
    assert_match(/\w+/, @tester.episode)
  end
end
