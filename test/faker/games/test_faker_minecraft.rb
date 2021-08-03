# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMinecraft < Test::Unit::TestCase
  def setup
    @minecraft = Faker::Games::Minecraft
  end

  def test_achievement
    assert @minecraft.achievement.match(/\w+/)
  end

  def test_biome
    assert @minecraft.biome.match(/\w+/)
  end

  def test_block
    assert @minecraft.block.match(/\w+/)
  end

  def test_enchantment
    assert @minecraft.enchantment.match(/\w+/)
  end

  def test_game_mode
    assert @minecraft.game_mode.match(/\w+/)
  end

  def test_item
    assert @minecraft.item.match(/\w+/)
  end

  def test_mob
    assert @minecraft.mob.match(/\w+/)
  end

  def test_status_effect
    assert @minecraft.status_effect.match(/\w+/)
  end
end
