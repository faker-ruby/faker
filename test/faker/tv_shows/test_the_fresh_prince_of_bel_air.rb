# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsTheFreshPrinceOfBelAir < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::TheFreshPrinceOfBelAir
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_actor
    assert_match @tester.actor, /\w+/
  end

  # deprecated
  def test_celebrity
    assert_match @tester.celebrity, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
