# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsThings < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::StrangerThings
  end

  def test_characters
    assert_match(/\w+/, @tester.character)
  end

  def test_quotes
    assert_match(/\w+/, @tester.quote)
  end
end
