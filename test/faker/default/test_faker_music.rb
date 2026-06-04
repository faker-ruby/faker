# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMusic < Test::Unit::TestCase
  def setup
    @tester = Faker::Music
  end

  def test_keys
    # rubocop:disable Style/HashEachMethods
    assert_equal(7, @tester.keys.size)
    @tester.keys.each do |key|
      refute_empty key.to_s
    end
    # rubocop:enable Style/HashEachMethods
  end

  def test_key_variants
    assert_equal(3, @tester.key_variants.size)
    @tester.key_variants.each do |key_variant|
      refute_nil key_variant
    end
  end

  def test_key_types
    assert_equal(2, @tester.key_types.size)
    @tester.key_types.each do |key_type|
      refute_nil key_type
    end
  end

  def test_chord_types
    assert_equal(12, @tester.chord_types.size)
    @tester.chord_types.each do |chord_type|
      refute_nil chord_type
    end
  end

  def test_key
    assert_match(/([A-Z])\s*(b|#){0,1}\s*(m){0,1}/, @tester.name)
  end

  def test_instrument
    assert_match(/\w+/, @tester.instrument)
  end

  def test_chord
    assert_match(/([A-Z])\s*(b|#){0,1}\s*([a-zA-Z0-9]{0,4})/, @tester.name)
  end

  def test_band
    assert_match(/\w+/, @tester.band)
  end

  def test_album
    assert_match(/\w+/, @tester.album)
  end

  def test_genre
    assert_match(/\w+/, @tester.genre)
  end

  def test_mambo_no_5
    assert_match(/\w+/, @tester.mambo_no_5)
  end
end
