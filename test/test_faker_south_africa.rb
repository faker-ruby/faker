# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerSouthAfrica < Test::Unit::TestCase
  def setup
    @tester = Faker::SouthAfrica
  end

  def test_id_number
    stubbed_id_number = '7201010001081'
    Faker::IDNumber.stub :south_african_id_number, stubbed_id_number do
      assert_equal stubbed_id_number, @tester.id_number
    end
  end

  def test_valid_id_number
    stubbed_id_number = '7201010001081'
    Faker::IDNumber.stub :valid_south_african_id_number, stubbed_id_number do
      assert_equal stubbed_id_number, @tester.valid_id_number
    end
  end

  def test_invalid_id_number
    stubbed_id_number = '9999990001081'
    Faker::IDNumber.stub :invalid_south_african_id_number, stubbed_id_number do
      assert_equal stubbed_id_number, @tester.invalid_id_number
    end
  end
end
