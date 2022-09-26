# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsTheThickOfIt < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::TheThickOfIt
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_department
    assert_match(/\w+/, @tester.department)
  end

  def test_position
    assert_match(/\w+/, @tester.position)
  end
end
