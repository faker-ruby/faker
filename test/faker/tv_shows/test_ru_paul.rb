# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerRuPaul < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::RuPaul
  end

  def test_quote
    assert_match @tester.quote, /\w+/i
  end

  def test_queen
    assert_match @tester.queen, /\w+/i
  end
end
