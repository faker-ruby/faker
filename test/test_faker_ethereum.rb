require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerEthereum < Test::Unit::TestCase
  def setup
    @tester = Faker::Ethereum
  end

  def test_address
    assert @tester.address.match(/0x([a-fA-F0-9]{40})/)
  end
end
