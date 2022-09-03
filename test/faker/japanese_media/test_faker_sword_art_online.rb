# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseSwordArtOnline < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::SwordArtOnline
  end

  def test_real_name
    assert_match @tester.real_name, /\w+\.?/
  end

  def test_game_name
    assert_match @tester.game_name, /\w+\.?/
  end

  def test_location
    assert_match @tester.location, /\w+\.?/
  end

  def test_item
    assert_match @tester.item, /\w+\.?/
  end
end
