# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsDumbAndDumber < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::DumbAndDumber
  end

  def test_actor
    assert_match(/\w+/, @tester.actor)
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
