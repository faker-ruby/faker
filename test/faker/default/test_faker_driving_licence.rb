# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDrivingLicence < Test::Unit::TestCase
  def setup
    @tester = Faker::DrivingLicence
  end

  def test_valid_gb_licence
    sample = @tester.british_driving_licence
    # GB Licence number is 16 characters long
    assert_equal 16, sample.length
    # First 5 characters are the last_name, right-padded with '9'
    assert_match %r{[A-Z][A-Z9]{4}}, sample[0..4]
    # Next 6 are digits
    assert_match %r{[0-9]{6}}, sample[5..10]
    # comprising:
    # Single digit decade of birth
    assert_includes 0..9, sample[5].to_i
    # 2 digit month of birth (add 5 to first digit if female)
    assert_includes [1..12, 51..62].map(&:to_a).flatten, sample[6..7].to_i
    # 2 digit day of birth
    assert_includes 1..31, sample[8..9].to_i
    # and least significant digit of birth year
    assert_includes 0..9, sample[10].to_i
    # Next 2 are first 2 initials of forenames, padded with '9'
    assert_match %r{[A-Z][A-Z9]}, sample[11..12]
    # Last stanza is a tie-breaker digit + 2 letter checksum
    assert_match %r{[0-9][A-Z0-9]{2}}, sample[13..15]
  end

  def test_valid_northern_irish_licence
    sample = @tester.northern_irish_driving_licence
    # NI licence is an opaque 8-digit number
    assert_equal 8, sample.length
    assert_match %r{[0-9]{8}}, sample
  end

  def test_uk_licence
    sample = @tester.uk_driving_licence
    assert_includes [8, 16], sample.length
  end

  def test_british_licence_correctly_mangles_last_name
    padded = @tester.british_driving_licence(last_name: 'Judd')
    assert_equal 'JUDD9', padded[0..4]
    truncated = @tester.british_driving_licence(last_name: 'Hamilton')
    assert_match %r{HAMIL[0-9]}, truncated[0..5]
    cleaned = @tester.british_driving_licence(last_name: "O'Carroll")
    assert_equal 'OCARR', cleaned[0..4]
  end

  def test_british_licence_correctly_mangles_date_of_birth
    date_of_birth = Date.parse('1978-02-13')
    male = @tester.british_driving_licence(date_of_birth: date_of_birth, gender: :male)
    assert_equal '702138', male[5..10]
    female = @tester.british_driving_licence(date_of_birth: date_of_birth, gender: :female)
    assert_equal '752138', female[5..10]
  end

  def test_british_licence_correctly_builds_initials
    padded = @tester.british_driving_licence(initials: 'A')
    assert_equal 'A9', padded[11..12]
    truncated = @tester.british_driving_licence(initials: 'NLTC')
    assert_equal 'NL', truncated[11..12]
  end

  def test_usa_driving_licence
    # When state is not passed to method it returns CA licence format by default
    licence_number = @tester.usa_driving_licence
    assert_match %r{[A-Z][0-9]{7}}, licence_number
  end

  def test_usa_driving_licence_for_different_states
    # When state Washington is passed
    licence_number = @tester.usa_driving_licence('Washington')
    assert_match %r{[A-Z]{7,12}[0-9]{0,5}\**}, licence_number

    # When state Alaska is passed
    licence_number = @tester.usa_driving_licence('alaska')
    assert_match %r{[0-9]{6,7}}, licence_number
  end

  def test_usa_driving_licence_with_faker_code
    assert_raises(Faker::InvalidStatePassed) do
      @tester.usa_driving_licence('abc')
    end

    assert_raises(Faker::InvalidStatePassed) do
      @tester.usa_driving_licence(123)
    end
  end
end
