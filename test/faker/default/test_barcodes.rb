# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBarcodes < Test::Unit::TestCase
  def setup
    @tester = Faker::Barcode
  end

  def test_ean
    assert_match @tester.ean, /[0-9]{8}/
    assert_equal(8, @tester.ean.length)

    assert_match @tester.ean(8), /[0-9]{8}/
    assert_equal(8, @tester.ean(8).length)

    assert_match @tester.ean(13), /[0-9]{13}/
    assert_equal(13, @tester.ean(13).length)
  end

  def test_ean_with_composite_symbology
    assert_match @tester.ean_with_composite_symbology, /[0-9]{8}|[A-Za-z0-9]{8}/
    assert_equal(17, @tester.ean_with_composite_symbology.length)

    assert_match @tester.ean_with_composite_symbology(8), /[0-9]{8}|[A-Za-z0-9]{8}/
    assert_equal(17, @tester.ean_with_composite_symbology(8).length)

    assert_match @tester.ean_with_composite_symbology(13), /[0-9]{13}|[A-Za-z0-9]{8}/
    assert_equal(22, @tester.ean_with_composite_symbology(13).length)
  end

  def test_upc_a
    assert_match @tester.upc_a, /[0-9]{12}/
    assert_equal(12, @tester.upc_a.length)
  end

  def test_upc_a_with_composite_symbol
    assert_match @tester.upc_a_with_composite_symbology, /[0-9]{12}|[A-Za-z0-9]{8}/
    assert_equal(21, @tester.upc_a_with_composite_symbology.length)
  end

  def test_upc_e
    assert_match @tester.upc_e, /[0-9]{8}/
    assert_equal(8, @tester.upc_e.length)
  end

  def test_upc_e_with_composite_symbol
    assert_match @tester.upc_e_with_composite_symbology, /[0-9]{8}|[A-Za-z0-9]{8}/
    assert_equal(17, @tester.upc_e_with_composite_symbology.length)
  end

  def test_isbn
    assert_match @tester.isbn, /^(978|9798|97910|97911|97912)[0-9]{8,10}/
    assert_equal(13, @tester.isbn.length)
  end

  def test_ismn
    assert_match @tester.ismn, /9790[0-9]{9}/
    assert_equal(13, @tester.ismn.length)
  end

  def test_issn
    assert_match @tester.issn, /977[0-9]{10}/
    assert_equal(13, @tester.issn.length)
  end

  def test_sum_even_odd
    assert_equal([12, 9], @tester.send(:sum_even_odd, 123_456))
    assert_equal([11, 21], @tester.send(:sum_even_odd, 857_363))
  end

  def test_generate_check_digit
    assert_equal(2, @tester.send(:generate_check_digit, 18, 24))
    assert_equal(4, @tester.send(:generate_check_digit, 21, 13))
  end
end
