# frozen_string_literal: true

require_relative '../../test_helper'

class TestDeprecateEthereum < Test::Unit::TestCase
  def setup
    @tester = Faker::Ethereum
  end

  def test_address
    assert @tester.address.match(/0x([a-fA-F0-9]{40})/)
  end
end
