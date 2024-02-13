# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsParksAndRec < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::ParksAndRec
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_city
    assert_match(/\w+/, @tester.city)
  end
end
