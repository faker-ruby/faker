# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseSwordArtOnline < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::SwordArtOnline
  end

  def test_real_name
    assert_match(/\w+\.?/, @tester.real_name)
  end

  def test_game_name
    assert_match(/\w+\.?/, @tester.game_name)
  end

  def test_location
    assert_match(/\w+\.?/, @tester.location)
  end

  def test_item
    assert_match(/\w+\.?/, @tester.item)
  end
end
