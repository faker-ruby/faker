# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAeternity < Test::Unit::TestCase
  def setup
    @tester = Faker::Blockchain::Aeternity
  end

  def test_address
    assert_match(/ak_([0-9a-zA-Z]{50}$)/, @tester.address)
  end

  def test_transaction
    assert_match(/th_([0-9a-zA-Z]{51}$)/, @tester.transaction)
  end

  def test_contract
    assert_match(/ct_([0-9a-zA-Z]{50}$)/, @tester.contract)
  end

  def test_oracle
    assert_match(/ok_([0-9a-zA-Z]{51}$)/, @tester.oracle)
  end
end
