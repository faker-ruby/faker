# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsBrooklynNineNine < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::BrooklynNineNine
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_episode
    assert @tester.episode.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
