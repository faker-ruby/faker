require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerBank < Test::Unit::TestCase

  def setup
    @tester = Faker::Bank
  end

  def test_name
    assert @tester.name.match(/(\w+\.? ?){2,3}/)
  end

  def test_swift_bic
    assert @tester.swift_bic.match(/(\w+\.? ?){2,3}/)
  end

  def test_iban_default
    assert @tester.iban.match(/[A-Z]{4}\d{14}/)
  end

  def test_iban_at
    assert @tester.iban("at").match(/\d{16}/)
  end

  def test_iban_pl
    assert @tester.iban("pl").match(/\d{8}[A-Z0-9]{16}/)
  end

  def test_iban_be
    assert @tester.iban("be").match(/\d{12}/)
  end

  def test_iban_bg
    assert @tester.iban("bg").match(/[A-Z]{4}\d{6}[A-Z0-9]{8}/)
  end

  def test_iban_hr
    assert @tester.iban("hr").match(/\d{17}/)
  end

  def test_iban_cy
    assert @tester.iban("cy").match(/\d{8}[A-Z0-9]{16}/)
  end

  def test_iban_cz
    assert @tester.iban("cz").match(/\d{20}/)
  end

  def test_iban_dk
    assert @tester.iban("dk").match(/\d{14}/)
  end

  def test_iban_ee
    assert @tester.iban("ee").match(/\d{16}/)
  end

  def test_iban_fi
    assert @tester.iban("fi").match(/\d{14}/)
  end

  def test_iban_fr
    assert @tester.iban("fr").match(/\d{10}[A-Z0-9]{11}\d{2}/)
  end

  def test_iban_de
    assert @tester.iban("de").match(/\d{18}/)
  end

  def test_iban_gr
    assert @tester.iban("gr").match(/\d{7}[A-Z0-9]{16}/)
  end

  def test_iban_hu
    assert @tester.iban("hu").match(/\d{24}/)
  end

  def test_iban_ie
    assert @tester.iban("ie").match(/[A-Z]{4}\d{14}/)
  end

  def test_iban_it
    assert @tester.iban("it").match(/[A-Z]\d{10}[A-Z0-9]{12}/)
  end

  def test_iban_lv
    assert @tester.iban("lv").match(/[A-Z]{4}[A-Z0-9]{13}/)
  end

  def test_iban_lt
    assert @tester.iban("lt").match(/\d{16}/)
  end

  def test_iban_lu
    assert @tester.iban("lu").match(/\d{3}[A-Z0-9]{13}/)
  end

  def test_iban_mt
    assert @tester.iban("mt").match(/[A-Z]{4}\d{5}[A-Z0-9]{18}/)
  end

  def test_iban_nl
    assert @tester.iban("nl").match(/\ANL\d{2}[A-Z]{4}\d{10}\z/)
  end

  def test_iban_ro
    assert @tester.iban("ro").match(/[A-Z]{4}[A-Z0-9]{16}/)
  end

  def test_iban_es
    assert @tester.iban("es").match(/\d{20}/)
  end

  def test_iban_se
    assert @tester.iban("se").match(/\d{20}/)
  end

  def test_iban_sk
    assert @tester.iban("sk").match(/\d{24}/)
  end


  def test_iban_invalid
    assert_raise ArgumentError.new("Could not find iban details for bad") do
       @tester.iban("bad")
    end
  end
end
