# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseMediaStudioGhibli < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::StudioGhibli
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end

  def test_movie
    assert_match @tester.movie, /\w+/
  end
end
