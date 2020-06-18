# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerEthereum < Test::Unit::TestCase
  def setup
    @tester = Faker::Blockchain::Ethereum
  end

  def test_address
    assert @tester.address.match?(/0x([a-fA-F0-9]{40})/)
  end
end
