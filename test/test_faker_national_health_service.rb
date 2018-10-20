# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerNationalHealthService < Test::Unit::TestCase
  def setup
    @tester = Faker::NationalHealthService
  end

  def test_nhs_british_number
    omit 'fix me'

    assert_match(/\A\d{3}\s\d{3}\s\d{4}\z/, @tester.british_number)
  end

  def test_nhs_check_digit
    assert_equal 6, @tester.check_digit(400_012_114)
  end
end
