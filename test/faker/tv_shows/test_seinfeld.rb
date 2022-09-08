# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsSeinfeld < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Seinfeld
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end

  def test_business
    assert_match(/\w+/, @tester.quote)
  end
end
