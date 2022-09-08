# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsTheOffice < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::TheOffice
  end

  def test_characters
    assert_match(/\w+/, @tester.character)
  end

  def test_quotes
    assert_match(/\w+/, @tester.quote)
  end
end
