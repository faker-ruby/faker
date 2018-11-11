# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCosmere < Test::Unit::TestCase
  def setup
    @tester = Faker::Cosmere
  end

  def test_aon
    assert @tester.aon.match(/\w+\.?/)
  end

  def test_shard_world
    assert @tester.shard_world.match(/\w+\.?/)
  end

  def test_shard
    assert @tester.shard.match(/\w+\.?/)
  end

  def test_surge
    assert @tester.surge.match(/\w+\.?/)
  end

  def test_knight_radiant
    assert @tester.knight_radiant.match(/\w+\.?/)
  end

  def test_metal
    assert @tester.metal.match(/\w+\.?/)
  end

  def test_allomancer
    assert @tester.allomancer.match(/\w+\.?/)
  end

  def test_herald
    assert @tester.herald.match(/\w+\.?/)
  end

  def test_spren
    assert @tester.spren.match(/\w+\.?/)
  end
end
