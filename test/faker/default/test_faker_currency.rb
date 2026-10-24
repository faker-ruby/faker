# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCurrency < Test::Unit::TestCase
  def setup
    @tester = Faker::Currency
  end

  def test_name
    assert_match(/[\w' ]+/, @tester.name)
  end

  def test_code
    assert_match(/[A-Z]{3}/, @tester.code)
  end

  def test_codes_are_unique
    codes = I18n.translate('faker.currency.code', locale: :en)
    duplicates = codes.tally.select { |_code, count| count > 1 }.keys

    assert_empty duplicates, "duplicated currency codes: #{duplicates.join(', ')}"
  end

  def test_names_name_a_single_currency
    names = I18n.translate('faker.currency.name', locale: :en)
    # Rows of the ISO 4217 table where a country uses two currencies used to be
    # read as one entry, leaving names such as 'Rand Namibia Dollar'.
    glued = names.select do |name|
      names.any? { |other| other != name && name.start_with?("#{other} ") }
    end

    assert_empty glued, "names holding two currencies: #{glued.join(', ')}"
  end

  def test_symbol
    assert_instance_of String, @tester.symbol
  end
end
