# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBank < Test::Unit::TestCase
  IBAN_HEADER = '[A-Z]{2}[0-9]{2}'

  def setup
    @tester = Faker::Bank
  end

  def test_routing_number
    routing_number = Faker::Bank.routing_number
    checksum = (
      7 * (routing_number[0].to_i + routing_number[3].to_i + routing_number[6].to_i) +
        3 * (routing_number[1].to_i + routing_number[4].to_i + routing_number[7].to_i) +
        9 * (routing_number[2].to_i + routing_number[5].to_i + routing_number[8].to_i)
    ) % 10

    assert_match(/\d{9}/, routing_number)
    assert_equal(0, checksum)
  end

  def test_routing_number_with_format
    fraction = Faker::Bank.routing_number_with_format

    assert_match(/\d{1,2}-\d{1,4}\/\d{1,4}/, fraction)
  end

  def test_bsb_number
    assert_match(/\d{6}/, Faker::Bank.bsb_number)
  end

  def test_account_number
    assert_match(/\d{10}/, Faker::Bank.account_number)

    assert_match(/\d{12}/, Faker::Bank.account_number(digits: 12))

    assert_match(/\d{100}/, Faker::Bank.account_number(digits: 100))
  end

  def test_name
    assert_match(/(\w+\.? ?){2,3}/, @tester.name)
  end

  def test_swift_bic
    assert_match(/(\w+\.? ?){2,3}/, @tester.swift_bic)
  end

  # This test makes sure there are no collisions in BIC number pool
  # https://github.com/faker-ruby/faker/pull/2130#issuecomment-703213837
  # def test_swift_bic_collission
  #   10.times do
  #     samplebic1 = @tester.swift_bic
  #     samplebic2 = @tester.swift_bic
  #     refute_equal samplebic1, samplebic2
  #   end
  # end

  def test_iban_country_code
    assert_match(/^[A-Z]{2}$/, @tester.iban_country_code)
  end

  def test_iban_default
    assert_match(/^GB\d{2}[A-Z]{4}\d{14}$/, @tester.iban)
  end

  def test_iban_rand_country
    assert_match(/^[A-Z]{2}\d{2}[A-Z\d]{10,30}$/, @tester.iban(country_code: nil))
  end

  def test_iban_checksum
    # Sourced IBANs from https://www.iban.com/structure
    accounts = {
      AL: { account: '202111090000000001234567', check_digit: '35' }, # AL35202111090000000001234567
      BY: { account: 'AKBB10100000002966000000', check_digit: '86' }, # BY86AKBB10100000002966000000
      CY: { account: '002001950000357001234567', check_digit: '21' }, # CY21002001950000357001234567
      DO: { account: 'ACAU00000000000123456789', check_digit: '22' }, # DO22ACAU00000000000123456789
      EG: { account: '0002000156789012345180002', check_digit: '80' }, # EG800002000156789012345180002
      FR: { account: '30006000011234567890189', check_digit: '76' }, # FR7630006000011234567890189
      GB: { account: 'BUKB20201555555555', check_digit: '33' }, # GB33BUKB20201555555555
      HU: { account: '116000060000000012345676', check_digit: '93' }, # HU93116000060000000012345676
      IT: { account: 'X0542811101000000123456', check_digit: '60' }, # IT60X0542811101000000123456
      JO: { account: 'CBJO0000000000001234567890', check_digit: '71' }, # JO71CBJO0000000000001234567890
      KW: { account: 'CBKU0000000000001234560101', check_digit: '81' }, # KW81CBKU0000000000001234560101
      LB: { account: '000700000000123123456123', check_digit: '92' }, # LB92000700000000123123456123
      MD: { account: 'EX000000000001234567', check_digit: '21' }, # MD21EX000000000001234567
      NL: { account: 'ABNA0123456789', check_digit: '02' }, # NL02ABNA0123456789
      PL: { account: '105000997603123456789123', check_digit: '10' }, # PL10105000997603123456789123
      QA: { account: 'QNBA000000000000693123456', check_digit: '54' }, # QA54QNBA000000000000693123456
      RU: { account: '04452560040702810412345678901', check_digit: '02' }, # RU0204452560040702810412345678901
      SC: { account: 'MCBL01031234567890123456USD', check_digit: '74' }, # SC74MCBL01031234567890123456USD
      TR: { account: '0010009999901234567890', check_digit: '32' }, # TR320010009999901234567890
      UA: { account: '3052992990004149123456789', check_digit: '90' }, # UA903052992990004149123456789
      VG: { account: 'ABVI0000000123456789', check_digit: '07' } # VG07ABVI0000000123456789
    }

    accounts.each do |country_code, data|
      assert_equal data[:check_digit], @tester.send(:iban_checksum, country_code.to_s, data[:account])
    end
  end

  # Andorra
  def test_iban_ad
    account = @tester.iban(country_code: 'ad')

    assert_equal(24, account.length)
    assert_match(/^#{IBAN_HEADER}\d{8}[A-Z0-9]{12}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # United Arab Emirates
  def test_iban_ae
    account = @tester.iban(country_code: 'ae')

    assert_equal(23, account.length)
    assert_match(/^#{IBAN_HEADER}\d{19}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Albania
  def test_iban_al
    account = @tester.iban(country_code: 'al')

    assert_equal(28, account.length)
    assert_match(/^#{IBAN_HEADER}\d{8}[A-Z0-9]{16}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Austria
  def test_iban_at
    account = @tester.iban(country_code: 'at')

    assert_equal(20, account.length)
    assert_match(/^#{IBAN_HEADER}\d{16}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Azerbaijan, Republic of
  def test_iban_az
    account = @tester.iban(country_code: 'az')

    assert_equal(28, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{20}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Bosnia
  def test_iban_ba
    account = @tester.iban(country_code: 'ba')

    assert_equal(20, account.length)
    assert_match(/^#{IBAN_HEADER}\d{16}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Belgium
  def test_iban_be
    account = @tester.iban(country_code: 'be')

    assert_equal(16, account.length)
    assert_match(/^#{IBAN_HEADER}\d{12}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Bulgaria
  def test_iban_bg
    account = @tester.iban(country_code: 'bg')

    assert_equal(22, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}\d{6}[A-Z0-9]{8}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Bahrain
  def test_iban_bh
    account = @tester.iban(country_code: 'bh')

    assert_equal(22, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{14}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Brazil
  def test_iban_br
    account = @tester.iban(country_code: 'br')

    assert_equal(29, account.length)
    assert_match(/^#{IBAN_HEADER}[0-9]{8}[0-9]{5}[0-9]{10}[A-Z]{1}[A-Z0-9]{1}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Switzerland
  def test_iban_ch
    account = @tester.iban(country_code: 'ch')

    assert_equal(21, account.length)
    assert_match(/^#{IBAN_HEADER}\d{5}[A-Z0-9]{12}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Costa Rica
  def test_iban_cr
    account = @tester.iban(country_code: 'cr')

    assert_equal(22, account.length)
    assert_match(/^#{IBAN_HEADER}0\d{3}\d{14}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Cyprus
  def test_iban_cy
    account = @tester.iban(country_code: 'cy')

    assert_equal(28, account.length)
    assert_match(/^#{IBAN_HEADER}\d{8}[A-Z0-9]{16}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Czech Republic
  def test_iban_cz
    account = @tester.iban(country_code: 'cz')

    assert_equal(24, account.length)
    assert_match(/^#{IBAN_HEADER}\d{20}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Germany
  def test_iban_de
    account = @tester.iban(country_code: 'de')

    assert_equal(22, account.length)
    assert_match(/^#{IBAN_HEADER}\d{18}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Denmark
  def test_iban_dk
    account = @tester.iban(country_code: 'dk')

    assert_equal(18, account.length)
    assert_match(/^#{IBAN_HEADER}\d{14}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Dominican Republic
  def test_iban_do
    account = @tester.iban(country_code: 'do')

    assert_equal(28, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}\d{20}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Estonia
  def test_iban_ee
    account = @tester.iban(country_code: 'ee')

    assert_equal(20, account.length)
    assert_match(/^#{IBAN_HEADER}\d{16}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Spain
  def test_iban_es
    account = @tester.iban(country_code: 'es')

    assert_equal(24, account.length)
    assert_match(/^#{IBAN_HEADER}\d{20}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Finland
  def test_iban_fi
    account = @tester.iban(country_code: 'fi')

    assert_equal(18, account.length)
    assert_match(/^#{IBAN_HEADER}\d{14}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Faroe Islands
  def test_iban_fo
    account = @tester.iban(country_code: 'fo')

    assert_equal(18, account.length)
    assert_match(/^#{IBAN_HEADER}\d{14}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # France
  def test_iban_fr
    100.times do
      account = @tester.iban(country_code: 'fr')

      assert_equal(27, account.length)
      assert_match(/^#{IBAN_HEADER}\d{10}[A-Z0-9]{11}\d{2}$/, account)
      assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
    end
  end

  # United Kingdom
  def test_iban_gb
    100.times do
      account = @tester.iban(country_code: 'gb')

      assert_equal(22, account.length)
      assert_match(/^#{IBAN_HEADER}[A-Z]{4}\d{14}$/, account)
      assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
    end
  end

  # Georgia
  def test_iban_ge
    account = @tester.iban(country_code: 'ge')

    assert_equal(22, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{2}\d{16}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Gibraltar
  def test_iban_gi
    account = @tester.iban(country_code: 'gi')

    assert_equal(23, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{15}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Greenland
  def test_iban_gl
    account = @tester.iban(country_code: 'gl')

    assert_equal(18, account.length)
    assert_match(/^#{IBAN_HEADER}\d{14}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Greece
  def test_iban_gr
    account = @tester.iban(country_code: 'gr')

    assert_equal(27, account.length)
    assert_match(/^#{IBAN_HEADER}\d{7}[A-Z0-9]{16}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Guatemala
  def test_iban_gt
    account = @tester.iban(country_code: 'gt')

    assert_equal(28, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z0-9]{4}\d{2}\d{2}[A-Z0-9]{16}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Croatia
  def test_iban_hr
    account = @tester.iban(country_code: 'hr')

    assert_equal(21, account.length)
    assert_match(/^#{IBAN_HEADER}\d{17}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Hungary
  def test_iban_hu
    account = @tester.iban(country_code: 'hu')

    assert_equal(28, account.length)
    assert_match(/^#{IBAN_HEADER}\d{24}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Ireland
  def test_iban_ie
    account = @tester.iban(country_code: 'ie')

    assert_equal(22, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}\d{14}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Israel
  def test_iban_il
    account = @tester.iban(country_code: 'il')

    assert_equal(23, account.length)
    assert_match(/^#{IBAN_HEADER}\d{19}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Iceland
  def test_iban_is
    account = @tester.iban(country_code: 'is')

    assert_equal(26, account.length)
    assert_match(/^#{IBAN_HEADER}\d{22}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Italy
  def test_iban_it
    account = @tester.iban(country_code: 'it')

    assert_equal(27, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]\d{10}[A-Z0-9]{12}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Kuwait
  def test_iban_kw
    account = @tester.iban(country_code: 'kw')

    assert_equal(30, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}\d{22}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Kazakhstan
  def test_iban_kz
    account = @tester.iban(country_code: 'kz')

    assert_equal(20, account.length)
    assert_match(/^#{IBAN_HEADER}[0-9]{3}[A-Z0-9]{13}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Lebanon
  def test_iban_lb
    account = @tester.iban(country_code: 'lb')

    assert_equal(28, account.length)
    assert_match(/^#{IBAN_HEADER}\d{4}[A-Z0-9]{20}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Liechtenstein
  def test_iban_li
    account = @tester.iban(country_code: 'li')

    assert_equal(21, account.length)
    assert_match(/^#{IBAN_HEADER}\d{5}[A-Z0-9]{12}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Lithuania
  def test_iban_lt
    account = @tester.iban(country_code: 'lt')

    assert_equal(20, account.length)
    assert_match(/^#{IBAN_HEADER}\d{16}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Luxembourg
  def test_iban_lu
    account = @tester.iban(country_code: 'lu')

    assert_equal(20, account.length)
    assert_match(/^#{IBAN_HEADER}\d{3}[A-Z0-9]{13}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Latvia
  def test_iban_lv
    account = @tester.iban(country_code: 'lv')

    assert_equal(21, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{13}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Monaco
  def test_iban_mc
    account = @tester.iban(country_code: 'mc')

    assert_equal(27, account.length)
    assert_match(/^#{IBAN_HEADER}\d{10}[A-Z0-9]{11}\d{2}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Moldova
  def test_iban_md
    account = @tester.iban(country_code: 'md')

    assert_equal(24, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{2}[A-Z0-9]{18}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Montenegro
  def test_iban_me
    account = @tester.iban(country_code: 'me')

    assert_equal(22, account.length)
    assert_match(/^#{IBAN_HEADER}\d{18}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Macedonia
  def test_iban_mk
    account = @tester.iban(country_code: 'mk')

    assert_equal(19, account.length)
    assert_match(/^#{IBAN_HEADER}\d{3}[A-Z0-9]{10}\d{2}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Mauritania
  def test_iban_mr
    account = @tester.iban(country_code: 'mr')

    assert_equal(27, account.length)
    assert_match(/^#{IBAN_HEADER}\d{23}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Malta
  def test_iban_mt
    account = @tester.iban(country_code: 'mt')

    assert_equal(31, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}\d{5}[A-Z0-9]{18}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Mauritius
  def test_iban_mu
    account = @tester.iban(country_code: 'mu')

    assert_equal(30, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}\d{19}[A-Z]{3}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Netherlands
  def test_iban_nl
    account = @tester.iban(country_code: 'nl')

    assert_equal(18, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}\d{10}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Norway
  def test_iban_no
    account = @tester.iban(country_code: 'no')

    assert_equal(15, account.length)
    assert_match(/^#{IBAN_HEADER}\d{11}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Pakistan
  def test_iban_pk
    account = @tester.iban(country_code: 'pk')

    assert_equal(24, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{16}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Poland
  def test_iban_pl
    account = @tester.iban(country_code: 'pl')

    assert_equal(28, account.length)
    assert_match(/^#{IBAN_HEADER}\d{8}[A-Z0-9]{16}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Palestinian Territory, Occupied
  def test_iban_ps
    account = @tester.iban(country_code: 'ps')

    assert_equal(29, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{21}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Portugal
  def test_iban_pt
    account = @tester.iban(country_code: 'pt')

    assert_equal(25, account.length)
    assert_match(/^#{IBAN_HEADER}\d{21}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Qatar
  def test_iban_qa
    account = @tester.iban(country_code: 'qa')

    assert_equal(29, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{21}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Romania
  def test_iban_ro
    account = @tester.iban(country_code: 'ro')

    assert_equal(24, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{16}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Serbia
  def test_iban_rs
    account = @tester.iban(country_code: 'rs')

    assert_equal(22, account.length)
    assert_match(/^#{IBAN_HEADER}\d{18}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Saudi Arabia
  def test_iban_sa
    account = @tester.iban(country_code: 'sa')

    assert_equal(24, account.length)
    assert_match(/^#{IBAN_HEADER}\d{2}[A-Z0-9]{18}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Sweden
  def test_iban_se
    account = @tester.iban(country_code: 'se')

    assert_equal(24, account.length)
    assert_match(/^#{IBAN_HEADER}\d{20}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Slovenia
  def test_iban_si
    account = @tester.iban(country_code: 'si')

    assert_equal(19, account.length)
    assert_match(/^#{IBAN_HEADER}\d{15}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Slovakia
  def test_iban_sk
    account = @tester.iban(country_code: 'sk')

    assert_equal(24, account.length)
    assert_match(/^#{IBAN_HEADER}\d{20}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # San Marino
  def test_iban_sm
    account = @tester.iban(country_code: 'sm')

    assert_equal(27, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]\d{10}[A-Z0-9]{12}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Timor-Leste
  def test_iban_tl
    account = @tester.iban(country_code: 'tl')

    assert_equal(23, account.length)
    assert_match(/^#{IBAN_HEADER}\d{19}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Tunisia
  def test_iban_tn
    account = @tester.iban(country_code: 'tn')

    assert_equal(24, account.length)
    assert_match(/^#{IBAN_HEADER}\d{20}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Turkey
  def test_iban_tr
    account = @tester.iban(country_code: 'tr')

    assert_equal(26, account.length)
    assert_match(/^#{IBAN_HEADER}\d{5}[A-Z0-9]{17}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Ukraine
  def test_iban_ua
    account = @tester.iban(country_code: 'ua')

    assert_equal(29, account.length)
    assert_match(/^#{IBAN_HEADER}\d{25}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Virgin Islands, British
  def test_iban_vg
    account = @tester.iban(country_code: 'vg')

    assert_equal(24, account.length)
    assert_match(/^#{IBAN_HEADER}[A-Z]{4}\d{16}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  # Kosovo, Republic of
  def test_iban_xk
    account = @tester.iban(country_code: 'xk')

    assert_equal(20, account.length)
    assert_match(/^#{IBAN_HEADER}\d{16}$/, account)
    assert valid_iban_checksum?(account), 'IBAN checksum is invalid'
  end

  def test_iban_invalid
    assert_raise ArgumentError.new('Could not find iban details for bad') do
      @tester.iban(country_code: 'bad')
    end
  end

  private

  # https://en.wikipedia.org/wiki/International_Bank_Account_Number#Validating_the_IBAN
  def valid_iban_checksum?(iban)
    # Check digit should be between 2..98
    return false unless (2..98).include? iban[2, 2].to_i

    iban = (iban[4..] + iban[0..3]).upcase
    iban = iban.chars.map { |char| char =~ /[A-Z]/ ? char.ord - 55 : char }.join
    iban.to_i % 97 == 1
  end
end
