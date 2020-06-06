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

    assert routing_number.match(/\d{9}/)
    assert_equal(checksum, 0)
  end

  def test_routing_number_with_format
    fraction = Faker::Bank.routing_number_with_format
    assert fraction.match(/\d{1,2}[-]\d{1,4}[\/]\d{1,4}/)
  end

  def test_bsb_number
    assert Faker::Bank.bsb_number.match(/\d{6}/)
  end

  def test_account_number
    assert Faker::Bank.account_number.match(/\d{10}/)

    assert Faker::Bank.account_number(digits: 12).match(/\d{12}/)

    assert Faker::Bank.account_number(digits: 100).match(/\d{100}/)
  end

  def test_name
    assert @tester.name.match(/(\w+\.? ?){2,3}/)
  end

  def test_swift_bic
    assert @tester.swift_bic.match(/(\w+\.? ?){2,3}/)
  end

  # This test makes sure there are no collissions in BIC number pool
  def test_swift_bic_collission
    10.times do
      samplebic1 = @tester.swift_bic
      samplebic2 = @tester.swift_bic
      refute_equal samplebic1, samplebic2
    end
  end

  def test_iban_default
    assert @tester.iban.match(/[A-Z]{4}\d{14}/)
  end

  # Andorra
  def test_iban_ad
    account = @tester.iban(country_code: 'ad')
    assert account.length == 24
    assert account.match(/^#{IBAN_HEADER}\d{8}[A-Z0-9]{12}$/)
  end

  # United Arab Emirates
  def test_iban_ae
    account = @tester.iban(country_code: 'ae')
    assert account.length == 23
    assert account.match(/^#{IBAN_HEADER}\d{19}$/)
  end

  # Albania
  def test_iban_al
    account = @tester.iban(country_code: 'al')
    assert account.length == 28
    assert account.match(/^#{IBAN_HEADER}\d{8}[A-Z0-9]{16}$/)
  end

  # Austria
  def test_iban_at
    account = @tester.iban(country_code: 'at')
    assert account.length == 20
    assert account.match(/^#{IBAN_HEADER}\d{16}$/)
  end

  # Azerbaijan, Republic of
  def test_iban_az
    account = @tester.iban(country_code: 'az')
    assert account.length == 28
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{20}$/)
  end

  # Bosnia
  def test_iban_ba
    account = @tester.iban(country_code: 'ba')
    assert account.length == 20
    assert account.match(/^#{IBAN_HEADER}\d{16}$/)
  end

  # Belgium
  def test_iban_be
    account = @tester.iban(country_code: 'be')
    assert account.length == 16
    assert account.match(/^#{IBAN_HEADER}\d{12}$/)
  end

  # Bulgaria
  def test_iban_bg
    account = @tester.iban(country_code: 'bg')
    assert account.length == 22
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}\d{6}[A-Z0-9]{8}$/)
  end

  # Bahrain
  def test_iban_bh
    account = @tester.iban(country_code: 'bh')
    assert account.length == 22
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{14}$/)
  end

  # Brazil
  def test_iban_br
    account = @tester.iban(country_code: 'br')
    assert account.length == 29
    assert account.match(/^#{IBAN_HEADER}[0-9]{8}[0-9]{5}[0-9]{10}[A-Z]{1}[A-Z0-9]{1}$/)
  end

  # Switzerland
  def test_iban_ch
    account = @tester.iban(country_code: 'ch')
    assert account.length == 21
    assert account.match(/^#{IBAN_HEADER}\d{5}[A-Z0-9]{12}$/)
  end

  # Costa Rica
  def test_iban_cr
    account = @tester.iban(country_code: 'cr')
    assert account.length == 22
    assert account.match(/^#{IBAN_HEADER}0\d{3}\d{14}$/)
  end

  # Cyprus
  def test_iban_cy
    account = @tester.iban(country_code: 'cy')
    assert account.length == 28
    assert account.match(/^#{IBAN_HEADER}\d{8}[A-Z0-9]{16}$/)
  end

  # Czech Republic
  def test_iban_cz
    account = @tester.iban(country_code: 'cz')
    assert account.length == 24
    assert account.match(/^#{IBAN_HEADER}\d{20}$/)
  end

  # Germany
  def test_iban_de
    account = @tester.iban(country_code: 'de')
    assert account.length == 22
    assert account.match(/^#{IBAN_HEADER}\d{18}$/)
  end

  # Denmark
  def test_iban_dk
    account = @tester.iban(country_code: 'dk')
    assert account.length == 18
    assert account.match(/^#{IBAN_HEADER}\d{14}$/)
  end

  # Dominican Republic
  def test_iban_do
    account = @tester.iban(country_code: 'do')
    assert account.length == 28
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}\d{20}$/)
  end

  # Estonia
  def test_iban_ee
    account = @tester.iban(country_code: 'ee')
    assert account.length == 20
    assert account.match(/^#{IBAN_HEADER}\d{16}$/)
  end

  # Spain
  def test_iban_es
    account = @tester.iban(country_code: 'es')
    assert account.length == 24
    assert account.match(/^#{IBAN_HEADER}\d{20}$/)
  end

  # Finland
  def test_iban_fi
    account = @tester.iban(country_code: 'fi')
    assert account.length == 18
    assert account.match(/^#{IBAN_HEADER}\d{14}$/)
  end

  # Faroe Islands
  def test_iban_fo
    account = @tester.iban(country_code: 'fo')
    assert account.length == 18
    assert account.match(/^#{IBAN_HEADER}\d{14}$/)
  end

  # France
  def test_iban_fr
    account = @tester.iban(country_code: 'fr')
    assert account.length == 27
    assert account.match(/^#{IBAN_HEADER}\d{10}[A-Z0-9]{11}\d{2}$/)
  end

  # United Kingdom
  def test_iban_gb
    account = @tester.iban(country_code: 'gb')
    assert account.length == 22
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}\d{14}$/)
  end

  # Georgia
  def test_iban_ge
    account = @tester.iban(country_code: 'ge')
    assert account.length == 22
    assert account.match(/^#{IBAN_HEADER}[A-Z]{2}\d{16}$/)
  end

  # Gibraltar
  def test_iban_gi
    account = @tester.iban(country_code: 'gi')
    assert account.length == 23
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{15}$/)
  end

  # Greenland
  def test_iban_gl
    account = @tester.iban(country_code: 'gl')
    assert account.length == 18
    assert account.match(/^#{IBAN_HEADER}\d{14}$/)
  end

  # Greece
  def test_iban_gr
    account = @tester.iban(country_code: 'gr')
    assert account.length == 27
    assert account.match(/^#{IBAN_HEADER}\d{7}[A-Z0-9]{16}$/)
  end

  # Guatemala
  def test_iban_gt
    account = @tester.iban(country_code: 'gt')
    assert account.length == 28
    assert account.match(/^#{IBAN_HEADER}[A-Z0-9]{4}\d{2}\d{2}[A-Z0-9]{16}$/)
  end

  # Croatia
  def test_iban_hr
    account = @tester.iban(country_code: 'hr')
    assert account.length == 21
    assert account.match(/^#{IBAN_HEADER}\d{17}$/)
  end

  # Hungary
  def test_iban_hu
    account = @tester.iban(country_code: 'hu')
    assert account.length == 28
    assert account.match(/^#{IBAN_HEADER}\d{24}$/)
  end

  # Ireland
  def test_iban_ie
    account = @tester.iban(country_code: 'ie')
    assert account.length == 22
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}\d{14}$/)
  end

  # Israel
  def test_iban_il
    account = @tester.iban(country_code: 'il')
    assert account.length == 23
    assert account.match(/^#{IBAN_HEADER}\d{19}$/)
  end

  # Iceland
  def test_iban_is
    account = @tester.iban(country_code: 'is')
    assert account.length == 26
    assert account.match(/^#{IBAN_HEADER}\d{22}$/)
  end

  # Italy
  def test_iban_it
    account = @tester.iban(country_code: 'it')
    assert account.length == 27
    assert account.match(/^#{IBAN_HEADER}[A-Z]\d{10}[A-Z0-9]{12}$/)
  end

  # Kuwait
  def test_iban_kw
    account = @tester.iban(country_code: 'kw')
    assert account.length == 30
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}\d{22}$/)
  end

  # Kazakhstan
  def test_iban_kz
    account = @tester.iban(country_code: 'kz')
    assert account.length == 20
    assert account.match(/^#{IBAN_HEADER}[0-9]{3}[A-Z0-9]{13}$/)
  end

  # Lebanon
  def test_iban_lb
    account = @tester.iban(country_code: 'lb')
    assert account.length == 28
    assert account.match(/^#{IBAN_HEADER}\d{4}[A-Z0-9]{20}$/)
  end

  # Liechtenstein
  def test_iban_li
    account = @tester.iban(country_code: 'li')
    assert account.length == 21
    assert account.match(/^#{IBAN_HEADER}\d{5}[A-Z0-9]{12}$/)
  end

  # Lithuania
  def test_iban_lt
    account = @tester.iban(country_code: 'lt')
    assert account.length == 20
    assert account.match(/^#{IBAN_HEADER}\d{16}$/)
  end

  # Luxembourg
  def test_iban_lu
    account = @tester.iban(country_code: 'lu')
    assert account.length == 20
    assert account.match(/^#{IBAN_HEADER}\d{3}[A-Z0-9]{13}$/)
  end

  # Latvia
  def test_iban_lv
    account = @tester.iban(country_code: 'lv')
    assert account.length == 21
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{13}$/)
  end

  # Monaco
  def test_iban_mc
    account = @tester.iban(country_code: 'mc')
    assert account.length == 27
    assert account.match(/^#{IBAN_HEADER}\d{10}[A-Z0-9]{11}\d{2}$/)
  end

  # Moldova
  def test_iban_md
    account = @tester.iban(country_code: 'md')
    assert account.length == 24
    assert account.match(/^#{IBAN_HEADER}[A-Z]{2}[A-Z0-9]{18}$/)
  end

  # Montenegro
  def test_iban_me
    account = @tester.iban(country_code: 'me')

    assert account.length == 22
    assert account.match(/^#{IBAN_HEADER}\d{18}$/)
  end

  # Macedonia
  def test_iban_mk
    account = @tester.iban(country_code: 'mk')
    assert account.length == 19
    assert account.match(/^#{IBAN_HEADER}\d{3}[A-Z0-9]{10}\d{2}$/)
  end

  # Mauritania
  def test_iban_mr
    account = @tester.iban(country_code: 'mr')
    assert account.length == 27
    assert account.match(/^#{IBAN_HEADER}\d{23}$/)
  end

  # Malta
  def test_iban_mt
    account = @tester.iban(country_code: 'mt')
    assert account.length == 31
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}\d{5}[A-Z0-9]{18}$/)
  end

  # Mauritius
  def test_iban_mu
    account = @tester.iban(country_code: 'mu')
    assert account.length == 30
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}\d{19}[A-Z]{3}$/)
  end

  # Netherlands
  def test_iban_nl
    account = @tester.iban(country_code: 'nl')
    assert account.length == 18
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}\d{10}$/)
  end

  # Norway
  def test_iban_no
    account = @tester.iban(country_code: 'no')
    assert account.length == 15
    assert account.match(/^#{IBAN_HEADER}\d{11}$/)
  end

  # Pakistan
  def test_iban_pk
    account = @tester.iban(country_code: 'pk')
    assert account.length == 24
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{16}$/)
  end

  # Poland
  def test_iban_pl
    account = @tester.iban(country_code: 'pl')
    assert account.length == 28
    assert account.match(/^#{IBAN_HEADER}\d{8}[A-Z0-9]{16}$/)
  end

  # Palestinian Territory, Occupied
  def test_iban_ps
    account = @tester.iban(country_code: 'ps')
    assert account.length == 29
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{21}$/)
  end

  # Portugal
  def test_iban_pt
    account = @tester.iban(country_code: 'pt')
    assert account.length == 25
    assert account.match(/^#{IBAN_HEADER}\d{21}$/)
  end

  # Qatar
  def test_iban_qa
    account = @tester.iban(country_code: 'qa')
    assert account.length == 29
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{21}$/)
  end

  # Romania
  def test_iban_ro
    account = @tester.iban(country_code: 'ro')
    assert account.length == 24
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}[A-Z0-9]{16}$/)
  end

  # Serbia
  def test_iban_rs
    account = @tester.iban(country_code: 'rs')
    assert account.length == 22
    assert account.match(/^#{IBAN_HEADER}\d{18}$/)
  end

  # Saudi Arabia
  def test_iban_sa
    account = @tester.iban(country_code: 'sa')
    assert account.length == 24
    assert account.match(/^#{IBAN_HEADER}\d{2}[A-Z0-9]{18}$/)
  end

  # Sweden
  def test_iban_se
    account = @tester.iban(country_code: 'se')
    assert account.length == 24
    assert account.match(/^#{IBAN_HEADER}\d{20}$/)
  end

  # Slovenia
  def test_iban_si
    account = @tester.iban(country_code: 'si')
    assert account.length == 19
    assert account.match(/^#{IBAN_HEADER}\d{15}$/)
  end

  # Slovakia
  def test_iban_sk
    account = @tester.iban(country_code: 'sk')
    assert account.length == 24
    assert account.match(/^#{IBAN_HEADER}\d{20}$/)
  end

  # San Marino
  def test_iban_sm
    account = @tester.iban(country_code: 'sm')
    assert account.length == 27
    assert account.match(/^#{IBAN_HEADER}[A-Z]\d{10}[A-Z0-9]{12}$/)
  end

  # Timor-Leste
  def test_iban_tl
    account = @tester.iban(country_code: 'tl')
    assert account.length == 23
    assert account.match(/^#{IBAN_HEADER}\d{19}$/)
  end

  # Tunisia
  def test_iban_tn
    account = @tester.iban(country_code: 'tn')
    assert account.length == 24
    assert account.match(/^#{IBAN_HEADER}\d{20}$/)
  end

  # Turkey
  def test_iban_tr
    account = @tester.iban(country_code: 'tr')
    assert account.length == 26
    assert account.match(/^#{IBAN_HEADER}\d{5}[A-Z0-9]{17}$/)
  end

  # Ukraine
  def test_iban_ua
    account = @tester.iban(country_code: 'ua')
    assert account.length == 29
    assert account.match(/^#{IBAN_HEADER}\d{25}$/)
  end

  # Virgin Islands, British
  def test_iban_vg
    account = @tester.iban(country_code: 'vg')
    assert account.length == 24
    assert account.match(/^#{IBAN_HEADER}[A-Z]{4}\d{16}$/)
  end

  # Kosovo, Republic of
  def test_iban_xk
    account = @tester.iban(country_code: 'xk')
    assert account.length == 20
    assert account.match(/^#{IBAN_HEADER}\d{16}$/)
  end

  def test_iban_invalid
    assert_raise ArgumentError.new('Could not find iban details for bad') do
      @tester.iban(country_code: 'bad')
    end
  end
end
