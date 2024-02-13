# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCowboyBebop < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::CowboyBebop
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_episode
    assert_match(/\w+/, @tester.episode)
  end

  def test_song
    assert_match(/\w+/, @tester.song)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
