# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSlackEmoji < Test::Unit::TestCase
  def setup
    @tester = Faker::SlackEmoji
    @emoticon_regex = /^:([\w-]+):$/
  end

  def test_people
    assert_match @emoticon_regex, @tester.people
  end

  def test_nature
    assert_match @emoticon_regex, @tester.nature
  end

  def test_food_and_drink
    assert_match @emoticon_regex, @tester.food_and_drink
  end

  def test_celebration
    assert_match @emoticon_regex, @tester.celebration
  end

  def test_activity
    assert_match @emoticon_regex, @tester.activity
  end

  def test_travel_and_places
    assert_match @emoticon_regex, @tester.travel_and_places
  end

  def test_objects_and_symbols
    assert_match @emoticon_regex, @tester.objects_and_symbols
  end

  def test_custom
    assert_match @emoticon_regex, @tester.custom
  end

  def test_emoji
    assert_match @emoticon_regex, @tester.emoji
  end
end
