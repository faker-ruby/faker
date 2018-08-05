# frozen_string_literal: true

require_relative 'test_helper'

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
    assert_raises ArgumentError do
      Date.parse(south_african_id_number_to_date_of_birth_string(sample))
    end
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
