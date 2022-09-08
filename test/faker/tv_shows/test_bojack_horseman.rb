# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsBojackHorseman < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::BojackHorseman
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_tongue_twister
    assert_match(/\w+/, @tester.tongue_twister)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
