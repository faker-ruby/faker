# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsTheOffice < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::TheOffice
  end

  def test_characters
    assert_match @tester.character, /\w+/
  end

  def test_quotes
    assert_match @tester.quote, /\w+/
  end
end
