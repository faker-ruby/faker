# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsBojackHorseman < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::BojackHorseman
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_tongue_twister
    assert @tester.tongue_twister.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
