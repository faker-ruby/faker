# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSlackEmoji < Test::Unit::TestCase
  def setup
    @tester = Faker::SlackEmoji
    @emoticon_regex = /^:([\w-]+):$/
  end

  def test_people
    assert_match @tester.people, @emoticon_regex
  end

  def test_nature
    assert_match @tester.nature, @emoticon_regex
  end

  def test_food_and_drink
    assert_match @tester.food_and_drink, @emoticon_regex
  end

  def test_celebration
    assert_match @tester.celebration, @emoticon_regex
  end

  def test_activity
    assert_match @tester.activity, @emoticon_regex
  end

  def test_travel_and_places
    assert_match @tester.travel_and_places, @emoticon_regex
  end

  def test_objects_and_symbols
    assert_match @tester.objects_and_symbols, @emoticon_regex
  end

  def test_custom
    assert_match @tester.custom, @emoticon_regex
  end

  def test_emoji
    assert_match @tester.emoji, @emoticon_regex
  end
end
