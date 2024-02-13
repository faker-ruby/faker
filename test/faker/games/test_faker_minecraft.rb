# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMinecraft < Test::Unit::TestCase
  def setup
    @minecraft = Faker::Games::Minecraft
  end

  def test_achievement
    assert_match(/\w+/, @minecraft.achievement)
  end

  def test_biome
    assert_match(/\w+/, @minecraft.biome)
  end

  def test_block
    assert_match(/\w+/, @minecraft.block)
  end

  def test_enchantment
    assert_match(/\w+/, @minecraft.enchantment)
  end

  def test_game_mode
    assert_match(/\w+/, @minecraft.game_mode)
  end

  def test_item
    assert_match(/\w+/, @minecraft.item)
  end

  def test_mob
    assert_match(/\w+/, @minecraft.mob)
  end

  def test_status_effect
    assert_match(/\w+/, @minecraft.status_effect)
  end
end
