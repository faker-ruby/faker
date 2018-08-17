# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestNoNOLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'no-NO'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_no_invoice_methods
    assert Faker::Invoice.creditor_reference.is_a? String
    assert Faker::Invoice.reference.is_a? String
    assert Faker::Invoice.reference('699027016279494093882102#').is_a? String
    assert Faker::Invoice.reference('699027016279494093882102#') == '6990270162794940938821025'
  end
end
