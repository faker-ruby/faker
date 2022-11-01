# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCompany < Test::Unit::TestCase
  def setup
    @tester = Faker::Company
  end

  def test_ein
    assert_match(/\d\d-\d\d\d\d\d\d\d/, @tester.ein)
  end

  def test_duns_number
    assert_match(/\d\d-\d\d\d-\d\d\d\d/, @tester.duns_number)
  end

  def test_logo
    assert_match %r{https://pigment.github.io/fake-logos/logos/medium/color/\d+\.png}, @tester.logo
  end

  def test_buzzword
    assert_match(/\w+\.?/, @tester.buzzword)
  end

  def test_type
    assert_match(/\w+/, @tester.type)
  end

  def test_spanish_organisation_number
    assert cif_valid?(@tester.spanish_organisation_number(organization_type: 'A'))
    assert cif_valid?(@tester.spanish_organisation_number)
  end

  def test_swedish_organisation_number
    org_no = @tester.swedish_organisation_number

    assert_match(/\d{10}/, org_no)
    assert_includes [1, 2, 3, 5, 6, 7, 8, 9], org_no[0].to_i
    assert org_no[2].to_i >= 2
    assert_equal org_no[9], @tester.send(:luhn_algorithm, org_no[0..8]).to_s
  end

  def test_czech_organisation_number
    org_no = @tester.czech_organisation_number

    assert_match(/\d{8}/, org_no)
    assert_includes [0, 1, 2, 3, 5, 6, 7, 8, 9], org_no[0].to_i
    assert_equal czech_o_n_checksum(org_no), org_no[-1].to_i
  end

  def test_french_siren_number
    siren = @tester.french_siren_number

    assert_match(/\A\d{9}\z/, siren)
    assert_equal siren[8], @tester.send(:luhn_algorithm, siren[0..-2]).to_s
  end

  def test_french_siret_number
    siret = @tester.french_siret_number

    assert_match(/\A\d{14}\z/, siret)
    assert_equal siret[8], @tester.send(:luhn_algorithm, siret[0..7]).to_s
    assert_equal siret[13], @tester.send(:luhn_algorithm, siret[0..-2]).to_s
  end

  def test_norwegian_organisation_number
    org_no = @tester.norwegian_organisation_number

    assert_match(/\d{9}/, org_no)
    assert_includes [8, 9], org_no[0].to_i
    assert_equal org_no[8], @tester.send(:mod11, org_no[0..7]).to_s
  end

  def test_australian_business_number
    abn = @tester.australian_business_number
    checksum = abn_checksum(abn)

    assert_match(/\d{11}/, abn)
    assert_predicate((checksum % 89), :zero?)
  end

  def test_profession
    assert_match(/[a-z ]+\.?/, @tester.profession)
  end

  def test_polish_taxpayer_identification_number
    number = @tester.polish_taxpayer_identification_number
    control_sum = 0
    [6, 5, 7, 2, 3, 4, 5, 6, 7].each_with_index do |control, index|
      control_sum += control * number[index].to_i
    end

    refute_equal control_sum.modulo(11), 10
  end

  def test_polish_register_of_national_economy
    # 8 length should fail
    assert_raise ArgumentError do
      @tester.polish_register_of_national_economy(length: 8)
    end
    # 9 length
    number = @tester.polish_register_of_national_economy
    control_sum = 0
    [8, 9, 2, 3, 4, 5, 6, 7].each_with_index do |control, index|
      control_sum += control * number[index].to_i
    end
    control_number = control_sum.modulo(11) == 10 ? 0 : control_sum.modulo(11)

    assert_equal control_number, number[8].to_i
    # 14 length
    number = @tester.polish_register_of_national_economy(length: 14)
    control_sum = 0
    [2, 4, 8, 5, 0, 9, 7, 3, 6, 1, 2, 4, 8].each_with_index do |control, index|
      control_sum += control * number[index].to_i
    end
    control_number = control_sum.modulo(11) == 10 ? 0 : control_sum.modulo(11)

    assert_equal control_number, number[13].to_i
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
    odd_base = Faker::Number.number(digits: [5, 7, 9, 11, 13].sample)
    odd_luhn_complement = @tester.send(:luhn_algorithm, odd_base).to_s
    odd_control = "#{odd_base}#{odd_luhn_complement}"

    # Even length base for luhn algorithm
    even_base = Faker::Number.number(digits: [4, 6, 8, 10, 12].sample)
    even_luhn_complement = @tester.send(:luhn_algorithm, even_base).to_s

    even_control = "#{even_base}#{even_luhn_complement}"

    assert_predicate((luhn_checksum(odd_control) % 10), :zero?)
    assert_predicate((luhn_checksum(even_control) % 10), :zero?)
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

  def test_russian_tax_number_default
    assert_match(/\d{10}/, @tester.russian_tax_number)
  end

  def test_russian_tax_number_individual
    assert_match(/\d{12}/, @tester.russian_tax_number(type: :individual))
  end

  def test_russian_tax_number_region
    assert_match(/^77/, @tester.russian_tax_number(region: '77'))
  end

  def test_russian_tax_number_checksum
    base_number = @tester.russian_tax_number
    number = base_number[0..-2]
    checksum = base_number.chars.last.to_i

    assert_predicate((inn_checksum(number) - checksum), :zero?)
  end

  def test_sic_code
    assert_match(/\d\d\d\d/, @tester.sic_code)
  end

  def test_spanish_cif_control_digit
    assert_equal(4, @tester.send(:spanish_cif_control_digit, 'A', '2217680'))
    assert_equal(7, @tester.send(:spanish_cif_control_digit, 'B', '4031315'))
    assert_equal(9, @tester.send(:spanish_cif_control_digit, 'C', '7191088'))
    assert_equal(6, @tester.send(:spanish_cif_control_digit, 'D', '3178686'))
    assert_equal(3, @tester.send(:spanish_cif_control_digit, 'E', '4484441'))
    assert_equal(4, @tester.send(:spanish_cif_control_digit, 'F', '4830511'))
    assert_equal(3, @tester.send(:spanish_cif_control_digit, 'G', '7676903'))
    assert_equal(2, @tester.send(:spanish_cif_control_digit, 'H', '8888075'))
    assert_equal(5, @tester.send(:spanish_cif_control_digit, 'J', '6840041'))
    assert_equal('G', @tester.send(:spanish_cif_control_digit, 'N', '5350867'))
    assert_equal('H', @tester.send(:spanish_cif_control_digit, 'P', '5669582'))
    assert_equal('D', @tester.send(:spanish_cif_control_digit, 'Q', '5182823'))
    assert_equal('E', @tester.send(:spanish_cif_control_digit, 'R', '1099088'))
    assert_equal('H', @tester.send(:spanish_cif_control_digit, 'S', '2210399'))
    assert_equal(8, @tester.send(:spanish_cif_control_digit, 'U', '3957325'))
    assert_equal(4, @tester.send(:spanish_cif_control_digit, 'V', '7536342'))
    assert_equal('B', @tester.send(:spanish_cif_control_digit, 'W', '6793772'))
  end

  def test_spanish_b_algorithm
    assert_equal(4, @tester.send(:spanish_b_algorithm, 2))
    assert_equal(3, @tester.send(:spanish_b_algorithm, 6))
  end

  private

  def czech_o_n_checksum(org_no)
    weights = [8, 7, 6, 5, 4, 3, 2]
    sum = 0
    digits = org_no.chars.map(&:to_i)
    weights.each_with_index.map do |w, i|
      sum += (w * digits[i])
    end
    (11 - (sum % 11)) % 10
  end

  def abn_checksum(abn)
    abn_weights = [10, 1, 3, 5, 7, 9, 11, 13, 15, 17, 19]

    abn.chars.map(&:to_i).each_with_index.map do |n, i|
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

  def inn_checksum(number)
    [2, 4, 10, 3, 5, 9, 4, 6, 8].map.with_index.reduce(0) do |v, i|
      v + i[0] * number[i[1]].to_i
    end % 11 % 10
  end

  def cif_valid?(cif)
    letters_cif = %w[A B C D E F G H J N P Q R S U V W]
    letter_cif_number = %w[P Q S W]
    letters_cif_control = %w[J A B C D E F G H I]
    regex_cif = /^(#{letters_cif.join('|')})-?(\d{7})-?(\d|#{letters_cif_control.join('|')})$/

    if cif =~ regex_cif
      number = Regexp.last_match(2)
      first_letter = Regexp.last_match(1)
      province_code = number[0..1]
      actual_control = Regexp.last_match(3)

      total = number.chars.each_with_index.inject(0) do |acc, (element, index)|
        acc + if index.even?
                (element.to_i * 2).digits.inject(:+)
              else
                element.to_i
              end
      end

      decimal = total.digits.first
      expected_control = decimal.zero? ? decimal : 10 - decimal

      # Control code must be a letter
      return letters_cif_control[expected_control] if letter_cif_number.include?(first_letter) ||
                                                      province_code == '00'

      # Control code will be a number or a letter
      return [expected_control.to_s,
              letters_cif_control[expected_control]].include?(actual_control)
    end

    false
  end
end
