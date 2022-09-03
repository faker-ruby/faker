# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCompass < Test::Unit::TestCase
  def setup
    @tester = Faker::Compass
    @word_pattern = /\w+/
    @multiword_pattern = /^\w+ by \w+$/
    @combined_pattern = /^(?:\w+|\w+ by \w+|[\w\-]+)$/
    @number_pattern = /^\d+(?:.\d\d?)?$/
    @letter_pattern = /^[NEWS]?[NEWS](?:b?[NEWS])?$/
  end

  def test_cardinal
    assert_match @tester.cardinal, @word_pattern
  end

  def test_ordinal
    assert_match @tester.ordinal, @word_pattern
  end

  def test_half_wind
    assert_match @tester.half_wind, @word_pattern
  end

  def test_quarter_wind
    assert_match @tester.quarter_wind, @multiword_pattern
  end

  def test_direction
    assert_match @tester.direction, @combined_pattern
  end

  def test_abbreviation
    assert_match @tester.abbreviation, @letter_pattern
  end

  def test_azimuth
    assert_match @tester.azimuth, @number_pattern
  end
end
