# frozen_string_literal: true

require_relative '../test_helper'

class TestDeprecateDog < Test::Unit::TestCase
  def setup
    @tester = Faker::Dog
  end

  def test_name
    assert @tester.name.match(/\w+\.?/)
  end

  def test_breed
    assert @tester.breed.match(/\w+\.?/)
  end

  def test_sound
    assert @tester.sound.match(/\w+\.?/)
  end

  def test_meme_phrase
    assert @tester.meme_phrase.match(/\w+\.?/)
  end

  def test_age
    assert @tester.age.match(/\w+\.?/)
  end

  def test_gender
    assert @tester.gender.match(/\w+\.?/)
  end

  def test_coat_length
    assert @tester.coat_length.match(/\w+\.?/)
  end

  def test_size
    assert @tester.size.match(/\w+\.?/)
  end
end
