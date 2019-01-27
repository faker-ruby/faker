# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsTheThickOfIt < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::TheThickOfIt
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_department
    assert @tester.department.match(/\w+/)
  end

  def test_position
    assert @tester.position.match(/\w+/)
  end
end
