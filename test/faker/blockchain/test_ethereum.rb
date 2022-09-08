# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerEthereum < Test::Unit::TestCase
  def setup
    @tester = Faker::Blockchain::Ethereum
  end

  def test_address
    assert_match(/0x([a-fA-F0-9]{40})/, @tester.address)
  end
end
