# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerPhone < Test::Unit::TestCase
  def setup
    @tester = Faker::PhoneNumber
    @phone_with_country_code_regex = /\A\+(\s|\d|-|\(|\)|x|\.)*\z/
  end

  def test_phone_number_min_1_max_3_length
    assert_match(/^\+\d{1,3}$/, @tester.country_code)
  end

  def test_phone_number_with_country_code
    assert_match(@phone_with_country_code_regex, @tester.phone_number_with_country_code)
  end

  def test_area_code
    assert_match(/\d{1,3}$/, @tester.area_code)
  end

  def test_exchange_code
    assert_match(/\d{1,3}$/, @tester.exchange_code)
  end

  def test_cell_phone_with_country_code
    assert_match(@phone_with_country_code_regex, @tester.cell_phone_with_country_code)
  end

  def test_cell_phone_in_e164
    assert_match(@phone_with_country_code_regex, @tester.cell_phone_in_e164)
  end

  def test_subscriber_number_with_no_arguments
    assert_match(/\d{4}$/, @tester.subscriber_number)
  end

  def test_subscriber_number_with_length_argument
    assert_match(/\d{2}$/, @tester.subscriber_number(length: 2))
  end

  def test_subscriber_number_with_invalid_length_argument
    exception = assert_raise(ArgumentError) do
      @tester.subscriber_number(length: '2')
    end

    assert_equal('length must be an Integer and be lesser than 10', exception.message)
  end

  def test_subscriber_number_with_length_greater_than_10
    exception = assert_raise(ArgumentError) do
      @tester.subscriber_number(length: 11)
    end

    assert_equal('length must be an Integer and be lesser than 10', exception.message)
  end
end
