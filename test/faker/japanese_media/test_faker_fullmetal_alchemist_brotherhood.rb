# frozen_string_literal: true

require_relative '../../test_helper'

class DeprecatedTestFakerFmaBrotherhood < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::FmaBrotherhood
  end

  def test_character
    actual_stdout, actual_stderr = capture_output do
      @tester.character
    end
    expected_warning = /NOTE: Faker::JapaneseMedia::FmaBrotherhood.character is deprecated; use Faker::JapaneseMedia::FullmetalAlchemistBrotherhood.character instead. It will be removed on or after 2024-02.*\n/

    assert_empty actual_stdout
    assert_match(expected_warning, actual_stderr)
  end

  def test_city
    actual_stdout, actual_stderr = capture_output do
      @tester.city
    end
    expected_warning = /NOTE: Faker::JapaneseMedia::FmaBrotherhood.city is deprecated; use Faker::JapaneseMedia::FullmetalAlchemistBrotherhood.city instead. It will be removed on or after 2024-02.*\n/

    assert_empty actual_stdout
    assert_match(expected_warning, actual_stderr)
  end

  def test_country
    actual_stdout, actual_stderr = capture_output do
      @tester.country
    end
    expected_warning = /NOTE: Faker::JapaneseMedia::FmaBrotherhood.country is deprecated; use Faker::JapaneseMedia::FullmetalAlchemistBrotherhood.country instead. It will be removed on or after 2024-02.*\n/

    assert_empty actual_stdout
    assert_match(expected_warning, actual_stderr)
  end
end

class TestFakerFullmetalAlchemistBrotherhood < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::FullmetalAlchemistBrotherhood
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_city
    assert_match(/\w+/, @tester.city)
  end

  def test_country
    assert_match(/\w+/, @tester.country)
  end
end
