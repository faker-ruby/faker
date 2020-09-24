# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseMediaStudioGhibli < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::StudioGhibli
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  def test_movie
    assert @tester.movie.match(/\w+/)
  end
end
