# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDog < Test::Unit::TestCase
  def setup
    @tester = Faker::Creature::Dog
  end

  def test_name
    assert_match(/\w+\.?/, @tester.name)
  end

  def test_breed
    assert_match(/\w+\.?/, @tester.breed)
  end

  def test_sound
    assert_match(/\w+\.?/, @tester.sound)
  end

  def test_meme_phrase
    assert_match(/\w+\.?/, @tester.meme_phrase)
  end

  def test_age
    assert_match(/\w+\.?/, @tester.age)
  end

  def test_gender
    assert_match(/\w+\.?/, @tester.gender)
  end

  def test_coat_length
    assert_match(/\w+\.?/, @tester.coat_length)
  end

  def test_size
    assert_match(/\w+\.?/, @tester.size)
  end
end
