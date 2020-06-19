# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMinecraft < Test::Unit::TestCase
  def setup
    @minecraft = Faker::Games::Minecraft
  end

  def test_block
    assert @minecraft.block.match(/\w+/)
  end

  def test_item
    assert @minecraft.item.match(/\w+/)
  end

  def test_mob
    assert @minecraft.mob.match(/\w+/)
  end
end
