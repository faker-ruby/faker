# frozen_string_literal: true

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
      assert random_amount <= to, "Expected <= \"#{to}\", but got #{random_amount}"
    end
  end

  def test_creditor_reference
    reference = @tester.creditor_reference

    assert reference.match(/RF\d{2}\d{4,20}/)
  end

  def test_reference
    reference = @tester.reference

    assert reference.match(/\d{4,20}/)
  end

  def test_reference_checksum
    reference = @tester.reference('515141803475128#')

    assert reference == '5151418034751285'
  end
end
