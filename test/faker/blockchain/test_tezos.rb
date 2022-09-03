# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTezos < Test::Unit::TestCase
  def test_contract
    assert_match Faker::Blockchain::Tezos.contract, /^KT1[1-9A-Za-z][^OIl]{20,40}/
  end

  def test_account
    assert_match Faker::Blockchain::Tezos.account, /^tz1[1-9A-Za-z][^OIl]{20,40}/
  end

  def test_operation
    assert_match Faker::Blockchain::Tezos.operation, /^o[1-9A-Za-z][^OIl]{20,40}/
  end

  def test_block
    assert_match Faker::Blockchain::Tezos.block, /^B[1-9A-Za-z][^OIl]{20,40}/
  end

  def test_signature
    assert_match Faker::Blockchain::Tezos.signature, /^edsig[1-9A-Za-z][^OIl]{20,40}/
  end

  def test_public_key
    assert_match Faker::Blockchain::Tezos.public_key, /^edpk[1-9A-Za-z][^OIl]{20,40}/
  end

  def test_secret_key
    assert_match Faker::Blockchain::Tezos.secret_key, /^edsk[1-9A-Za-z][^OIl]{20,40}/
  end

  def test_deterministic_contract
    Faker::Config.random = Random.new(42)
    v = Faker::Blockchain::Tezos.contract
    Faker::Config.random = Random.new(42)
    assert_equal v, Faker::Blockchain::Tezos.contract
  end
end
