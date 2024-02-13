# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDemographic < Test::Unit::TestCase
  def setup
    @tester = Faker::Demographic
  end

  def test_race
    assert_match(/\w+/, @tester.race)
  end

  def test_educational_attainment
    assert_match(/\w+/, @tester.educational_attainment)
  end

  def test_marital_status
    assert_match(/\w+/, @tester.marital_status)
  end

  def test_demonym
    assert_match(/\w+/, @tester.demonym)
  end

  def test_sex
    assert_includes %w[Male Female], @tester.sex
  end

  def test_height_imperial
    assert_match(/\w+/, @tester.height(unit: :imperial))
  end

  def test_height_metric
    assert_match(/\w+/, @tester.height)
  end
end
