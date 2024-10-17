# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTheater < Test::Unit::TestCase
  def test_adult_musical
    assert_match(/\w+/, Faker::Theater.adult_musical)
  end

  def test_kids_musical
    assert_match(/\w+/, Faker::Theater.kids_musical)
  end

  def test_play
    assert_match(/\w+/, Faker::Theater.play)
  end
end
