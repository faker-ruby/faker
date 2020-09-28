# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBarcodes < Test::Unit::TestCase
  def setup
    @tester = Faker::Barcode
  end

  def test_ean
    assert @tester.ean.match(/[0-9]{8}/)
    assert_equal @tester.ean.length, 8

    assert @tester.ean(8).match(/[0-9]{8}/)
    assert_equal @tester.ean(8).length, 8

    assert @tester.ean(13).match(/[0-9]{13}/)
    assert_equal @tester.ean(13).length, 13
  end

  def test_ean_with_composite_symbology
    assert @tester.ean_with_composite_symbology.match(/[0-9]{8}|[A-Za-z0-9]{8}/)
    assert_equal @tester.ean_with_composite_symbology.length, 17

    assert @tester.ean_with_composite_symbology(8).match(/[0-9]{8}|[A-Za-z0-9]{8}/)
    assert_equal @tester.ean_with_composite_symbology(8).length, 17

    assert @tester.ean_with_composite_symbology(13).match(/[0-9]{13}|[A-Za-z0-9]{8}/)
    assert_equal @tester.ean_with_composite_symbology(13).length, 22
  end

  def test_upc_a
    assert @tester.upc_a.match(/[0-9]{12}/)
    assert_equal @tester.upc_a.length, 12
  end

  def test_upc_a_with_composite_symbol
    assert @tester.upc_a_with_composite_symbology.match(/[0-9]{12}|[A-Za-z0-9]{8}/)
    assert_equal @tester.upc_a_with_composite_symbology.length, 21
  end

  def test_upc_e
    assert @tester.upc_e.match(/[0-9]{8}/)
    assert_equal @tester.upc_e.length, 8
  end

  def test_upc_e_with_composite_symbol
    assert @tester.upc_e_with_composite_symbology.match(/[0-9]{8}|[A-Za-z0-9]{8}/)
    assert_equal @tester.upc_e_with_composite_symbology.length, 17
  end

  def test_isbn
    assert @tester.isbn.match(/^(978|9798|97910|97911|97912)[0-9]{8,10}/)
    assert_equal @tester.isbn.length, 13
  end

  def test_ismn
    assert @tester.ismn.match(/9790[0-9]{9}/)
    assert_equal @tester.ismn.length, 13
  end

  def test_issn
    assert @tester.issn.match(/977[0-9]{10}/)
    assert_equal @tester.issn.length, 13
  end

  def test_sum_even_odd
    assert_equal @tester.send(:sum_even_odd, 123_456), [12, 9]
    assert_equal @tester.send(:sum_even_odd, 857_363), [11, 21]
  end

  def test_generate_check_digit
    assert_equal @tester.send(:generate_check_digit, 18, 24), 2
    assert_equal @tester.send(:generate_check_digit, 21, 13), 4
  end
end
