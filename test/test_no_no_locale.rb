# frozen_string_literal: true

require File.expand_path("#{File.dirname(__FILE__)}/test_helper.rb")

class TestNoNOLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'no-NO'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_no_no_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.female_first_name
    assert_kind_of String, Faker::Name.male_first_name
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.suffix
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_no_no_invoice_methods
    assert_kind_of String, Faker::Invoice.creditor_reference
    assert_kind_of String, Faker::Invoice.reference
    assert_kind_of String, Faker::Invoice.reference(ref: '699027016279494093882102#')
    assert_equal('6990270162794940938821025', Faker::Invoice.reference(ref: '699027016279494093882102#'))
  end
end
