require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerInternet < Test::Unit::TestCase

  def teardown
    Faker::Config.locale = nil
  end

  def test_vat_identifier
    Faker::Config.locale = :pl
    assert_match /\d{10}/, Faker::Identifier.vat
  end

end
