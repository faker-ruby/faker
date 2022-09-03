# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCosmere < Test::Unit::TestCase
  def setup
    @tester = Faker::Cosmere
  end

  def test_aon
    assert_match @tester.aon, /\w+\.?/
  end

  def test_shard_world
    assert_match @tester.shard_world, /\w+\.?/
  end

  def test_shard
    assert_match @tester.shard, /\w+\.?/
  end

  def test_surge
    assert_match @tester.surge, /\w+\.?/
  end

  def test_knight_radiant
    assert_match @tester.knight_radiant, /\w+\.?/
  end

  def test_metal
    assert_match @tester.metal, /\w+\.?/
  end

  def test_allomancer
    assert_match @tester.allomancer, /\w+\.?/
  end

  def test_herald
    assert_match @tester.herald, /\w+\.?/
  end

  def test_spren
    assert_match @tester.spren, /\w+\.?/
  end
end
