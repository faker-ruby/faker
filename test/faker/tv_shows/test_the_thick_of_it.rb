# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsTheThickOfIt < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::TheThickOfIt
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_department
    assert_match @tester.department, /\w+/
  end

  def test_position
    assert_match @tester.position, /\w+/
  end
end
