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
    assert_match @word_pattern, @tester.cardinal
  end

  def test_ordinal
    assert_match @word_pattern, @tester.ordinal
  end

  def test_half_wind
    assert_match @word_pattern, @tester.half_wind
  end

  def test_quarter_wind
    assert_match @multiword_pattern, @tester.quarter_wind
  end

  def test_direction
    assert_match @combined_pattern, @tester.direction
  end

  def test_abbreviation
    assert_match @letter_pattern, @tester.abbreviation
  end

  def test_azimuth
    assert_match @number_pattern, @tester.azimuth
  end
end
