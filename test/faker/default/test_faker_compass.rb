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
    assert @tester.cardinal.match(@word_pattern)
  end

  def test_ordinal
    assert @tester.ordinal.match(@word_pattern)
  end

  def test_half_wind
    assert @tester.half_wind.match(@word_pattern)
  end

  def test_quarter_wind
    assert @tester.quarter_wind.match(@multiword_pattern)
  end

  def test_direction
    assert @tester.direction.match(@combined_pattern)
  end

  def test_abbreviation
    assert @tester.abbreviation.match(@letter_pattern)
  end

  def test_azimuth
    assert @tester.azimuth.match(@number_pattern)
  end
end
