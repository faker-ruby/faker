# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMinecraft < Test::Unit::TestCase
  def setup
    @minecraft = Faker::Games::Minecraft
  end

  def test_achievement
    assert_match @minecraft.achievement, /\w+/
  end

  def test_biome
    assert_match @minecraft.biome, /\w+/
  end

  def test_block
    assert_match @minecraft.block, /\w+/
  end

  def test_enchantment
    assert_match @minecraft.enchantment, /\w+/
  end

  def test_game_mode
    assert_match @minecraft.game_mode, /\w+/
  end

  def test_item
    assert_match @minecraft.item, /\w+/
  end

  def test_mob
    assert_match @minecraft.mob, /\w+/
  end

  def test_status_effect
    assert_match @minecraft.status_effect, /\w+/
  end
end
