# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsCommunity < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Community
  end

  def test_character
    assert @tester.characters.match?(/\w/)
  end

  def test_quote
    assert @tester.quotes.match?(/\w/)
  end
end
