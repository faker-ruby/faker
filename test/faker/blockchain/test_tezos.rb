# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTezos < Test::Unit::TestCase
  def test_contract
    assert Faker::Blockchain::Tezos.contract.match(/^KT1[1-9A-Za-z][^OIl]{20,40}/)
  end

  def test_account
    assert Faker::Blockchain::Tezos.account.match(/^tz1[1-9A-Za-z][^OIl]{20,40}/)
  end

  def test_operation
    assert Faker::Blockchain::Tezos.operation.match(/^o[1-9A-Za-z][^OIl]{20,40}/)
  end

  def test_block
    assert Faker::Blockchain::Tezos.block.match(/^B[1-9A-Za-z][^OIl]{20,40}/)
  end

  def test_signature
    assert Faker::Blockchain::Tezos.signature.match(/^edsig[1-9A-Za-z][^OIl]{20,40}/)
  end

  def test_public_key
    assert Faker::Blockchain::Tezos.public_key.match(/^edpk[1-9A-Za-z][^OIl]{20,40}/)
  end

  def test_secret_key
    assert Faker::Blockchain::Tezos.secret_key.match(/^edsk[1-9A-Za-z][^OIl]{20,40}/)
  end

  def test_deterministic_contract
    Faker::Config.random = Random.new(42)
    v = Faker::Blockchain::Tezos.contract
    Faker::Config.random = Random.new(42)
    assert v == Faker::Blockchain::Tezos.contract
  end
end
