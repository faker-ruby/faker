# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTezos < Test::Unit::TestCase
  def test_contract
    assert Faker::Tezos.contract.match(/^KT1[1-9A-Za-z][^OIl]{20,40}/)
  end

  def test_account
    assert Faker::Tezos.account.match(/^tz1[1-9A-Za-z][^OIl]{20,40}/)
  end

  def test_operation
    assert Faker::Tezos.operation.match(/^o[1-9A-Za-z][^OIl]{20,40}/)
  end

  def test_signature
    assert Faker::Tezos.signature.match(/^edsig[1-9A-Za-z][^OIl]{20,40}/)
  end

  def test_deterministic_contract
    Faker::Config.random = Random.new(42)
    v = Faker::Tezos.contract
    Faker::Config.random = Random.new(42)
    assert v == Faker::Tezos.contract
  end
end
