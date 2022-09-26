# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsTheFreshPrinceOfBelAir < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::TheFreshPrinceOfBelAir
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_actor
    assert_match(/\w+/, @tester.actor)
  end

  # deprecated
  def test_celebrity
    assert_match(/\w+/, @tester.celebrity)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
