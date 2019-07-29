# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseMediaAttackOnTitan < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::AttackOnTitan
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end
end
