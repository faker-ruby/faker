# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMagicTheGathering < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::MagicTheGathering
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end

  def test_color
    assert @tester.color.match(/\w+/)
  end

  def test_rarity
    assert @tester.rarity.match(/\w+/)
  end

  def test_type
    assert @tester.type.match(/\w+/)
  end
end
