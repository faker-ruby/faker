# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseMediaStudioGhibli < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::StudioGhibli
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end

  def test_movie
    assert_match(/\w+/, @tester.movie)
  end
end
