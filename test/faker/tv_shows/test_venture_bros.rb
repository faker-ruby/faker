# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsVentureBros < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::VentureBros
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_vehicle
    assert_match @tester.vehicle, /\w+/
  end

  def test_organization
    assert_match @tester.organization, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
