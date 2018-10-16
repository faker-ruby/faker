# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestNoNOLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'no-NO'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.suffix.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end

  def test_invoice_methods
    assert Faker::Invoice.creditor_reference.is_a? String
    assert Faker::Invoice.reference.is_a? String
    assert Faker::Invoice.reference('699027016279494093882102#').is_a? String
    assert Faker::Invoice.reference('699027016279494093882102#') == '6990270162794940938821025'
  end
end
