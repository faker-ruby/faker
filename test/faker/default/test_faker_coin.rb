# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCoin < Test::Unit::TestCase
  def setup
    @tester = Faker::Coin
  end

  def test_name
    assert @tester.name.match?(/\w+/)
  end

  def test_flip
    assert @tester.flip.match?(/\w+/)
  end
end
