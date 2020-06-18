# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerShow < Test::Unit::TestCase
  def test_adult_musical
    assert Faker::Show.adult_musical.match?(/\w+/)
  end

  def test_kids_musical
    assert Faker::Show.kids_musical.match?(/\w+/)
  end

  def test_play
    assert Faker::Show.play.match?(/\w+/)
  end
end
