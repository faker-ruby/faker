# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerShow < Test::Unit::TestCase
  def test_adult_musical
    assert_match(/\w+/, Faker::Show.adult_musical)
  end

  def test_kids_musical
    assert_match(/\w+/, Faker::Show.kids_musical)
  end

  def test_play
    assert_match(/\w+/, Faker::Show.play)
  end
end
