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

  def test_pty_ltd_registration_number
    stubbed_number = '2016/0123456/07'
    Faker::Company.stub :south_african_pty_ltd_registration_number, stubbed_number do
      assert_equal stubbed_number, @tester.pty_ltd_registration_number
    end
  end

  def test_close_corporation_registration_number
    stubbed_number = 'CK85/123456/23'
    Faker::Company.stub :south_african_close_corporation_registration_number, stubbed_number do
      assert_equal stubbed_number, @tester.close_corporation_registration_number
    end
  end

  def test_listed_company_registration_number
    stubbed_number = '1977/1234/06'
    Faker::Company.stub :south_african_listed_company_registration_number, stubbed_number do
      assert_equal stubbed_number, @tester.listed_company_registration_number
    end
  end

  def test_trust_registration_number
    stubbed_number = 'IT2018/78'
    Faker::Company.stub :south_african_trust_registration_number, stubbed_number do
      assert_equal stubbed_number, @tester.trust_registration_number
    end
  end

  def test_vat_number
    stubbed_number = 'ZA1234567890'
    Faker::Finance.stub :vat_number, stubbed_number, with: 'ZA' do
      assert_equal stubbed_number, @tester.vat_number
    end
  end
end
