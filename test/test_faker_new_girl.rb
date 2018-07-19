# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerNewGirl < Test::Unit::TestCase
  def setup
    @tester = Faker::NewGirl
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
