# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerNationalHealthService < Test::Unit::TestCase
  def setup
    @tester = Faker::NationalHealthService
  end

  def test_nhs_british_number
    assert_match(/\A9{3}\s\d{3}\s\d{4}\z/, @tester.british_number)
  end

  def test_check_digit_equals_10
    Faker::NationalHealthService.stub(:rand, 999_464_033) do
      assert_match('999 464 0321', @tester.british_number)
    end
  end
end
