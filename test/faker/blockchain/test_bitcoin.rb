# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBitcoin < Test::Unit::TestCase
  def test_address
    assert_match(/^[13][1-9A-Za-z][^OIl]{20,40}/, Faker::Blockchain::Bitcoin.address)
  end

  def test_deterministic_address
    Faker::Config.random = Random.new(42)
    v = Faker::Blockchain::Bitcoin.address
    Faker::Config.random = Random.new(42)
    assert_equal v, Faker::Blockchain::Bitcoin.address
  end

  def test_testnet_address
    assert_match(/\A[mn][1-9A-Za-z]{32,34}\Z/, Faker::Blockchain::Bitcoin.testnet_address)
    assert_not_match(/[OIl]/, Faker::Blockchain::Bitcoin.testnet_address)
  end
end
