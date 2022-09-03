# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerShow < Test::Unit::TestCase
  def test_adult_musical
    assert_match Faker::Show.adult_musical, /\w+/
  end

  def test_kids_musical
    assert_match Faker::Show.kids_musical, /\w+/
  end

  def test_play
    assert_match Faker::Show.play, /\w+/
  end
end
