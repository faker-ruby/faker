# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTezos < Test::Unit::TestCase
  def test_contract
    assert_match(/^KT1[1-9A-Za-z][^OIl]{20,40}/, Faker::Blockchain::Tezos.contract)
  end

  def test_account
    assert_match(/^tz1[1-9A-Za-z][^OIl]{20,40}/, Faker::Blockchain::Tezos.account)
  end

  def test_operation
    assert_match(/^o[1-9A-Za-z][^OIl]{20,40}/, Faker::Blockchain::Tezos.operation)
  end

  def test_block
    assert_match(/^B[1-9A-Za-z][^OIl]{20,40}/, Faker::Blockchain::Tezos.block)
  end

  def test_signature
    assert_match(/^edsig[1-9A-Za-z][^OIl]{20,40}/, Faker::Blockchain::Tezos.signature)
  end

  def test_public_key
    assert_match(/^edpk[1-9A-Za-z][^OIl]{20,40}/, Faker::Blockchain::Tezos.public_key)
  end

  def test_secret_key
    assert_match(/^edsk[1-9A-Za-z][^OIl]{20,40}/, Faker::Blockchain::Tezos.secret_key)
  end

  def test_deterministic_contract
    Faker::Config.random = Random.new(42)
    v = Faker::Blockchain::Tezos.contract
    Faker::Config.random = Random.new(42)

    assert_equal v, Faker::Blockchain::Tezos.contract
  end
end
