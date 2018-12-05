# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCompany < Test::Unit::TestCase
  def setup
    @tester = Faker::Company
  end

  def test_ein
    assert @tester.ein.match(/\d\d-\d\d\d\d\d\d\d/)
  end

  def test_duns_number
    assert @tester.duns_number.match(/\d\d-\d\d\d-\d\d\d\d/)
  end

  def test_logo
    assert @tester.logo.match(%r{https://pigment.github.io/fake-logos/logos/medium/color/\d+\.png})
  end

  def test_buzzword
    assert @tester.buzzword.match(/\w+\.?/)
  end

  def test_type
    assert @tester.type.match(/\w+/)
  end

  def test_spanish_organisation_number
    org_no = @tester.spanish_organisation_number
    assert org_no.match(/\D\d{7}/)
    assert %w[A B C D E F G H J N P Q R S U V W].include?(org_no[0].to_s)
  end

  def test_swedish_organisation_number
    org_no = @tester.swedish_organisation_number
    assert org_no.match(/\d{10}/)
    assert [1, 2, 3, 5, 6, 7, 8, 9].include?(org_no[0].to_i)
    assert org_no[2].to_i >= 2
    assert org_no[9] == @tester.send(:luhn_algorithm, org_no[0..8]).to_s
  end

  def test_czech_organisation_number
    org_no = @tester.czech_organisation_number
    assert org_no.match(/\d{8}/)
    assert [0, 1, 2, 3, 5, 6, 7, 8, 9].include?(org_no[0].to_i)
    assert czech_o_n_checksum(org_no) == org_no[-1].to_i
  end

  def test_french_siren_number
    siren = @tester.french_siren_number
    assert siren.match(/\A\d{9}\z/)
    assert siren[8] == @tester.send(:luhn_algorithm, siren[0..-2]).to_s
  end

  def test_french_siret_number
    siret = @tester.french_siret_number
    assert siret.match(/\A\d{14}\z/)
    assert siret[8] == @tester.send(:luhn_algorithm, siret[0..7]).to_s
    assert siret[13] == @tester.send(:luhn_algorithm, siret[0..-2]).to_s
  end

  def test_norwegian_organisation_number
    org_no = @tester.norwegian_organisation_number
    assert org_no.match(/\d{9}/)
    assert [8, 9].include?(org_no[0].to_i)
    assert org_no[8] == @tester.send(:mod11, org_no[0..7]).to_s
  end

  def test_australian_business_number
    abn = @tester.australian_business_number
    checksum = abn_checksum(abn)

    assert abn.match(/\d{11}/)
    assert((checksum % 89).zero?)
  end

  def test_profession
    assert @tester.profession.match(/[a-z ]+\.?/)
  end

  def test_polish_taxpayer_identification_number
    number = @tester.polish_taxpayer_identification_number
    control_sum = 0
    [6, 5, 7, 2, 3, 4, 5, 6, 7].each_with_index do |control, index|
      control_sum += control * number[index].to_i
    end
    assert control_sum.modulo(11) != 10
  end

  def test_polish_register_of_national_economy
    # 8 length should fail
    assert_raise ArgumentError do
      @tester.polish_register_of_national_economy(8)
    end
    # 9 length
    number = @tester.polish_register_of_national_economy
    control_sum = 0
    [8, 9, 2, 3, 4, 5, 6, 7].each_with_index do |control, index|
      control_sum += control * number[index].to_i
    end
    control_number = control_sum.modulo(11) == 10 ? 0 : control_sum.modulo(11)
    assert control_number == number[8].to_i
    # 14 length
    number = @tester.polish_register_of_national_economy(14)
    control_sum = 0
    [2, 4, 8, 5, 0, 9, 7, 3, 6, 1, 2, 4, 8].each_with_index do |control, index|
      control_sum += control * number[index].to_i
    end
    control_number = control_sum.modulo(11) == 10 ? 0 : control_sum.modulo(11)
    assert control_number == number[13].to_i
  end

  def test_mod11
    assert @tester.send(:mod11, 0)
  end

  def test_south_african_pty_ltd_registration_number
    assert_match(
      /\A\d{4}\/\d{4,10}\/07\z/,
      @tester.south_african_pty_ltd_registration_number
    )
  end

  def test_south_african_close_corporation_registration_number
    assert_match(
      /\A(CK\d{2}|\d{4})\/\d{4,10}\/23\z/,
      @tester.south_african_close_corporation_registration_number
    )
  end

  def test_south_african_listed_company_registration_number
    assert_match(
      /\A\d{4}\/\d{4,10}\/06\z/,
      @tester.south_african_listed_company_registration_number
    )
  end

  def test_south_african_trust_registration_number
    assert_match(
      /\AIT\d{2,4}\/\d{2,10}\z/,
      @tester.south_african_trust_registration_number
    )
  end

  def test_luhn_algorithm
    # Odd length base for luhn algorithm
    odd_base = Faker::Number.number([5, 7, 9, 11, 13].sample)
    odd_luhn_complement = @tester.send(:luhn_algorithm, odd_base)
    odd_control = "#{odd_base}#{odd_luhn_complement}"

    # Even length base for luhn algorithm
    even_base = Faker::Number.number([4, 6, 8, 10, 12].sample)
    even_luhn_complement = @tester.send(:luhn_algorithm, even_base)
    even_control = "#{even_base}#{even_luhn_complement}"

    assert((luhn_checksum(odd_control) % 10).zero?)
    assert((luhn_checksum(even_control) % 10).zero?)
  end

  def test_brazilian_company_number
    sample = @tester.brazilian_company_number

    assert_match(/^\d{14}$/, sample)

    digit_sum = sample[0..11].chars.each_with_index.inject(0) do |acc, (digit, i)|
      factor = 2 + (3 - i) % 8
      acc + digit.to_i * factor
    end
    remainder = digit_sum % 11
    first_digit = remainder < 2 ? '0' : (11 - remainder).to_s
    assert_equal sample[12], first_digit

    digit_sum = sample[0..12].chars.each_with_index.inject(0) do |acc, (digit, i)|
      factor = 2 + (4 - i) % 8
      acc + digit.to_i * factor
    end
    remainder = digit_sum % 11
    second_digit = remainder < 2 ? '0' : (11 - remainder).to_s
    assert_equal sample[13], second_digit
  end

  def test_brazilian_company_number_formatted
    sample = @tester.brazilian_company_number(formatted: true)
    assert_match(/^\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}$/, sample)
  end

  private

  def czech_o_n_checksum(org_no)
    weights = [8, 7, 6, 5, 4, 3, 2]
    sum = 0
    digits = org_no.split('').map(&:to_i)
    weights.each_with_index.map do |w, i|
      sum += (w * digits[i])
    end
    (11 - (sum % 11)) % 10
  end

  def abn_checksum(abn)
    abn_weights = [10, 1, 3, 5, 7, 9, 11, 13, 15, 17, 19]

    abn.split('').map(&:to_i).each_with_index.map do |n, i|
      (i.zero? ? n - 1 : n) * abn_weights[i]
    end.inject(:+)
  end

  def luhn_checksum(luhn)
    luhn_split = luhn.each_char.map(&:to_i).reverse.each_with_index.map do |n, i|
      x = i.odd? ? n * 2 : n
      x > 9 ? x - 9 : x
    end

    luhn_split.compact.inject(0) { |sum, x| sum + x }
  end
end
