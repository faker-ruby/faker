# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerEmoji < Test::Unit::TestCase
  def setup
    @tester = Faker::Emoji
    # This regex specifies a non-ASCII character string
    @emoji_regex = /[^\x00-\x7F]/
  end

  def test_smileys_and_emotion
    assert_match @emoji_regex, @tester.smileys_and_emotion
  end

  def test_people_and_body
    assert_match @emoji_regex, @tester.people_and_body
  end

  def test_animals_and_nature
    assert_match @emoji_regex, @tester.animals_and_nature
  end

  def test_food_and_drink
    assert_match @emoji_regex, @tester.food_and_drink
  end

  def test_travel_and_places
    assert_match @emoji_regex, @tester.travel_and_places
  end

  def test_activities
    assert_match @emoji_regex, @tester.activities
  end

  def test_objects
    assert_match @emoji_regex, @tester.objects
  end

  def test_symbols
    assert_match @emoji_regex, @tester.symbols
  end

  def test_flags
    assert_match @emoji_regex, @tester.flags
  end

  def test_emoji
    assert_match @emoji_regex, @tester.emoji
  end
end
