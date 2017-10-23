require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerInvoice < Test::Unit::TestCase
  def setup
    @tester = Faker::Invoice
  end

  def test_amount_between
    from = 1.0
    to   = 1000.0

    100.times do
      random_amount = @tester.amount_between(from, to)
      assert random_amount >= from, "Expected >= \"#{from}\", but got #{random_amount}"
      assert random_amount <= to  , "Expected <= \"#{to}\", but got #{random_amount}"
    end
  end

  def test_reference
    reference = @tester.reference
    assert reference.match(/\d{4,20}/)
  end

  def test_reference_fi
    reference = @tester.reference('FI')
    assert reference.match(/\d{4,20}/)
  end

  def test_reference_ee
    reference = @tester.reference('EE')
    assert reference.match(/\d{2,20}/)
  end

  def test_reference_no
    reference = @tester.reference('NO')
    assert reference.match(/\d{25}/)
  end

  # Test check digits with few valid payloads
  def test_reference_fi_checksum
    reference = @tester.reference('FI','515141803475128#')
    assert reference == '5151418034751285'
  end

  def test_reference_ee_checksum
    reference = @tester.reference('EE','4106453482608858924#')
    assert reference == '41064534826088589243'
  end

  def test_reference_no_checksum
    reference = @tester.reference('NO','699027016279494093882102#')
    assert reference == '6990270162794940938821025'
  end

  def test_creditor_reference
    reference = @tester.creditor_reference
    assert reference.match(/RF\d{2}\d{4,20}/)
  end

  # Test RF reference with valid payload
  def test_creditor_reference_fi_checksum
    reference = @tester.creditor_reference('FI','5151418034751285')
    assert reference == 'RF835151418034751285'
  end
end
