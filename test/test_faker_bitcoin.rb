require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerBitcoin < Test::Unit::TestCase

  def test_address
    assert Faker::Bitcoin.address.match(/^[13][1-9A-Za-z][^OIl]{20,40}/)
  end

  def test_deterministic_address
    Faker::Config.random = Random.new(42)
    v = Faker::Bitcoin.address
    Faker::Config.random = Random.new(42)
    assert v == Faker::Bitcoin.address
  end

  def test_testnet_address
    assert_match(/\A[mn][1-9A-Za-z]{32,34}\Z/, Faker::Bitcoin.testnet_address)
    assert_not_match(/[OIl]/, Faker::Bitcoin.testnet_address)
  end

end
