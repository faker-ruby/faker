# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCode < Test::Unit::TestCase
  def setup
    @tester = Faker::Code
  end

  def test_npi_regexp
    assert_match @tester.npi, /[0-9]{10}/
  end

  def test_deterministic_npi
    Faker::Config.random = Random.new(42)
    v = @tester.npi
    Faker::Config.random = Random.new(42)

    assert_equal v, @tester.npi
  end

  def test_default_isbn_regexp
    assert_match @tester.isbn, /^\d{9}-[\d|X]$/
  end

  def test_default_isbn13_regexp
    assert_match @tester.isbn(base: 13), /^\d{12}-\d$/
  end

  def test_default_ean_regexp
    assert_match @tester.ean, /^\d{13}$/
  end

  def test_default_ean8_regexp
    assert_match @tester.ean(base: 8), /^\d{8}$/
  end

  def test_rut
    assert_match @tester.rut, /^\d{1,8}-(\d|k)$/
  end

  def test_asin
    assert_match @tester.asin, /^B000([A-Z]|\d){6}$/
  end

  def test_nric
    assert_match @tester.nric, /^(S|T)\d{7}[A-JZ]$/
  end

  def test_imei_regexp
    assert_match @tester.imei, /\A[\d.:\-\s]+\z/i
  end

  def test_imei_luhn_value
    assert luhn_checksum_valid(@tester.imei)
  end

  def test_sin
    assert_match @tester.sin, /\d{9}/
    assert_equal(9, @tester.sin.length)
    assert luhn_checksum_valid(@tester.sin)
  end

  def luhn_checksum_valid(numbers)
    sum = 0
    i = 0

    numbers.each_char do |ch|
      n = ch.to_i
      n *= 2 if i.odd?
      n = 1 + (n - 10) if n >= 10

      sum += n
      i += 1
    end

    (sum % 10).zero?
  end
end
