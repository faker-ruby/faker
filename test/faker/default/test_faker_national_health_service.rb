# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerNationalHealthService < Test::Unit::TestCase
  def setup
    @tester = Faker::NationalHealthService
  end

  def test_nhs_british_number
    assert_match(/\A\d{3}\s\d{3}\s\d{4}\z/, @tester.british_number)
  end

  def test_nhs_check_digit_equals_10
    Faker::NationalHealthService.stub(:rand, 458_617_434) do
      assert_match('458 617 4331', @tester.british_number)
    end
  end

  def test_nhs_check_digit
    assert_equal 6, @tester.check_digit(400_012_114)
  end

  def test_nhs_check_digit_11
    assert_equal 0, @tester.check_digit(418_513_625)
  end
end
