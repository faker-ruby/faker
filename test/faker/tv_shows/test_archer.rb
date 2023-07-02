# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsArcher < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Archer
  end

  def test_characters
    assert_match(/\w+/, @tester.character)
  end

  def test_locations
    assert_match(/\w+/, @tester.location)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
