# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSailorMoon < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::SailorMoon
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_transformation
    assert @tester.transformation.match(/\w+/)
  end

  def test_attack
    assert @tester.attack.match(/\w+/)
  end

  def test_item
    assert @tester.item.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end
end
