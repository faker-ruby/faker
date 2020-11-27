# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsBuffy < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Buffy
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  def test_actor
    assert @tester.actor.match(/\w+/)
  end

  # deprecated
  def test_celebrity
    assert @tester.celebrity.match(/\w+/)
  end

  def test_big_bad
    assert @tester.big_bad.match(/\w+/)
  end

  def test_episode
    assert @tester.episode.match(/\w+/)
  end
end
