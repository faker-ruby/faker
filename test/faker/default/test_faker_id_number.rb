# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerIdNumber < Test::Unit::TestCase
  def setup
    @tester = Faker::IDNumber
  end

  def test_valid_ssn
    sample = @tester.valid
    assert sample.length == 11
    assert_equal '-', sample[3]
    assert_equal '-', sample[6]
    assert sample[0..2].split.map { :to_i }.all? { :is_digit? }
    assert sample[4..5].split.map { :to_i }.all? { :is_digit? }
    assert sample[7..9].split.map { :to_i }.all? { :is_digit? }
  end

  def test_invalid_ssn
    sample = @tester.invalid
    assert sample.length == 11
    assert_equal '-', sample[3]
    assert_equal '-', sample[6]
    assert sample[0..2].split.map { :to_i }.all? { :is_digit? }
    assert sample[4..5].split.map { :to_i }.all? { :is_digit? }
    assert sample[7..9].split.map { :to_i }.all? { :is_digit? }
  end

  def test_spanish_dni
    sample = @tester.spanish_citizen_number
    assert_equal 10, sample.length
    assert sample[0..7].split.map { :to_i }.all? { :is_digit? }
    assert_equal sample[8], '-'
    mod = sample[0..7].to_i % 23
    assert_equal Faker::IDNumber::CHECKS[mod], sample[9]
  end

  def test_spanish_nie
    sample = @tester.spanish_foreign_citizen_number
    assert_equal 11, sample.length
    assert 'XYZ'.include?(sample[0])
    assert_equal '-', sample[1]
    assert sample[2..8].split.map { :to_i }.all? { :is_digit? }
    assert_equal '-', sample[9]
    prefix = 'XYZ'.index(sample[0]).to_s
    mod = "#{prefix}#{sample[2..8]}".to_i % 23
    assert_equal Faker::IDNumber::CHECKS[mod], sample[10]
  end

  def test_south_african_id_number
    assert_valid_south_african_id_number(@tester.south_african_id_number)
  end

  def test_valid_south_african_id_number
    assert_valid_south_african_id_number(@tester.valid_south_african_id_number)
  end

  def test_invalid_south_african_id_number
    sample = @tester.invalid_south_african_id_number

    # The error raised here is changed in Ruby 2.7.
    if RUBY_VERSION < '2.7'
      assert_raises ArgumentError do
        Date.parse(south_african_id_number_to_date_of_birth_string(sample))
      end
    elsif RUBY_VERSION >= '2.7'
      assert_raises Date::Error do
        Date.parse(south_african_id_number_to_date_of_birth_string(sample))
      end
    end
  end

  def test_brazilian_citizen_number
    sample = @tester.brazilian_citizen_number
    assert_match(/^\d{11}$/, sample)
    assert_match(/(\d)((?!\1)\d)+/, sample)
  end

  def test_brazilian_citizen_number_formatted
    sample = @tester.brazilian_citizen_number(formatted: true)
    assert_match(/^\d{3}\.\d{3}\.\d{3}-\d{2}$/, sample)
  end

  def test_brazilian_id
    sample = @tester.brazilian_id
    assert_match(/^\d{9}$/, sample)
    assert_match(/(\d)((?!\1)\d)+/, sample)
  end

  def test_brazilian_id_formatted
    sample = @tester.brazilian_id(formatted: true)
    assert_match(/^\d{1,2}.\d{3}.\d{3}-[\dX]$/, sample)
  end

  def test_brazilian_citizen_number_checksum_digit
    digits = '128991760'
    checksum_digit = Faker::IDNumber.send(:brazilian_citizen_number_checksum_digit, digits)
    assert_equal checksum_digit, '4'
    digits = '1289917604'
    checksum_digit = Faker::IDNumber.send(:brazilian_citizen_number_checksum_digit, digits)
    assert_equal checksum_digit, '8'
  end

  def test_brazilian_id_checksum_digit
    digits = '41987080'
    checksum_digit = Faker::IDNumber.send(:brazilian_id_checksum_digit, digits)
    assert_equal checksum_digit, '5'
  end

  def test_brazilian_document_checksum
    digits = '123456789'
    checksum = Faker::IDNumber.send(:brazilian_document_checksum, digits)
    assert_equal checksum, 2100
  end

  def test_brazilian_document_digit
    citizen_number_digit10 = Faker::IDNumber.send(:brazilian_document_digit, 10)
    citizen_number_digit_other = Faker::IDNumber.send(:brazilian_document_digit, 9)
    id_digit10 = Faker::IDNumber.send(:brazilian_document_digit, 1, id: true)
    id_digit11 = Faker::IDNumber.send(:brazilian_document_digit, 0, id: true)
    id_digit_other = Faker::IDNumber.send(:brazilian_document_digit, 2, id: true)
    assert_equal citizen_number_digit10, '0'
    assert_equal citizen_number_digit_other, '9'
    assert_equal id_digit10, 'X'
    assert_equal id_digit11, '0'
    assert_equal id_digit_other, '9'
  end

  def test_brazilian_citizen_number_digit
    digit10 = Faker::IDNumber.send(:brazilian_citizen_number_digit, 10)
    digit_other = Faker::IDNumber.send(:brazilian_citizen_number_digit, 9)
    assert_equal digit10, '0'
    assert_equal digit_other, '9'
  end

  def test_brazilian_id_digit
    digit10 = Faker::IDNumber.send(:brazilian_id_digit, 1)
    digit11 = Faker::IDNumber.send(:brazilian_id_digit, 0)
    digit_other = Faker::IDNumber.send(:brazilian_id_digit, 2)
    assert_equal digit10, 'X'
    assert_equal digit11, '0'
    assert_equal digit_other, '9'
  end

  def test_chilean_id
    sample = @tester.chilean_id
    assert_match(/^\d{8}-[K\d]$/, sample)
  end

  def test_chilean_verification_code_k
    verification_code = Faker::IDNumber.send(:chilean_verification_code, 20_680_873)

    assert_equal verification_code, 'K'
  end

  def test_chilean_verification_code_0
    verification_code = Faker::IDNumber.send(:chilean_verification_code, 13_196_022)

    assert_equal verification_code, 0
  end

  private

  def south_african_id_number_to_date_of_birth_string(sample)
    "19#{sample[0..1]}/#{sample[2..3]}/#{sample[4..5]}}"
  end

  def assert_valid_south_african_id_number(sample)
    assert_equal 13, sample.length
    assert_match(/^\d{13}$/, sample)
    assert_include Faker::IDNumber::ZA_CITIZENSHIP_DIGITS, sample[10]
    assert_equal Faker::IDNumber::ZA_RACE_DIGIT, sample[11]
    assert Date.parse(south_african_id_number_to_date_of_birth_string(sample))
  end
end
