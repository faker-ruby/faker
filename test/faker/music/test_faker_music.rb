# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMusic < Test::Unit::TestCase
  def setup
    @tester = Faker::Music
  end

  def test_keys
    assert @tester.keys.size == 7
    @tester.keys.each do |key|
      refute key.to_s.empty?
    end
  end

  def test_key_variants
    assert @tester.key_variants.size == 3
    @tester.key_variants.each do |key_variant|
      refute key_variant.nil?
    end
  end

  def test_key_types
    assert @tester.key_types.size == 2
    @tester.key_types.each do |key_type|
      assert !key_type.nil?
    end
  end

  def test_chord_types
    assert @tester.chord_types.size == 12
    @tester.chord_types.each do |chord_type|
      assert !chord_type.nil?
    end
  end

  def test_key
    assert @tester.name.match?(/([A-Z])\s*(b|#){0,1}\s*(m){0,1}/)
  end

  def test_instrument
    assert @tester.instrument.match?(/\w+/)
  end

  def test_chord
    assert @tester.name.match?(/([A-Z])\s*(b|#){0,1}\s*([a-zA-Z0-9]{0,4})/)
  end

  def test_band
    assert @tester.band.match?(/\w+/)
  end

  def test_album
    assert @tester.album.match?(/\w+/)
  end

  def test_genre
    assert @tester.genre.match?(/\w+/)
  end
end
