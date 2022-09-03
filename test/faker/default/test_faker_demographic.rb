# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDemographic < Test::Unit::TestCase
  def setup
    @tester = Faker::Demographic
  end

  def test_race
    assert_match @tester.race, /\w+/
  end

  def test_educational_attainment
    assert_match @tester.educational_attainment, /\w+/
  end

  def test_marital_status
    assert_match @tester.marital_status, /\w+/
  end

  def test_demonym
    assert_match @tester.demonym, /\w+/
  end

  def test_sex
    assert_includes %w[Male Female], @tester.sex
  end

  def test_height_imperial
    assert_match @tester.height(unit: :imperial), /\w+/
  end

  def test_height_metric
    assert_match @tester.height, /\w+/
  end
end
