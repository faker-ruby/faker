# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCosmere < Test::Unit::TestCase
  def setup
    @tester = Faker::Cosmere
  end

  def test_aon
    assert_match(/\w+\.?/, @tester.aon)
  end

  def test_shard_world
    assert_match(/\w+\.?/, @tester.shard_world)
  end

  def test_shard
    assert_match(/\w+\.?/, @tester.shard)
  end

  def test_surge
    assert_match(/\w+\.?/, @tester.surge)
  end

  def test_knight_radiant
    assert_match(/\w+\.?/, @tester.knight_radiant)
  end

  def test_metal
    assert_match(/\w+\.?/, @tester.metal)
  end

  def test_allomancer
    assert_match(/\w+\.?/, @tester.allomancer)
  end

  def test_herald
    assert_match(/\w+\.?/, @tester.herald)
  end

  def test_spren
    assert_match(/\w+\.?/, @tester.spren)
  end
end
