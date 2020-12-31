# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsFrTed < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::FrTed
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  def test_short_quote
    assert @tester.short_quote.match(/\w+/)
    10.times { assert @tester.short_quote.length <= 30 }
  end

  def test_long_quote
    assert @tester.long_quote.match(/\w+/)
    10.times { assert @tester.long_quote.length >= 256 }
  end
end
