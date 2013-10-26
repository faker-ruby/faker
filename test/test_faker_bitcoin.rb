require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerBitcoin < Test::Unit::TestCase

  def test_address
    assert Faker::Bitcoin.address.match(/^[13][1-9A-Za-z][^OIl]{20,40}/)
  end

end
