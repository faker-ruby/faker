# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDog < Test::Unit::TestCase
  def setup
    @tester = Faker::Creature::Dog
  end

  def test_name
    assert_match @tester.name, /\w+\.?/
  end

  def test_breed
    assert_match @tester.breed, /\w+\.?/
  end

  def test_sound
    assert_match @tester.sound, /\w+\.?/
  end

  def test_meme_phrase
    assert_match @tester.meme_phrase, /\w+\.?/
  end

  def test_age
    assert_match @tester.age, /\w+\.?/
  end

  def test_gender
    assert_match @tester.gender, /\w+\.?/
  end

  def test_coat_length
    assert_match @tester.coat_length, /\w+\.?/
  end

  def test_size
    assert_match @tester.size, /\w+\.?/
  end
end
