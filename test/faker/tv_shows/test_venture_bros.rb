# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsVentureBros < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::VentureBros
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_vehicle
    assert_match(/\w+/, @tester.vehicle)
  end

  def test_organization
    assert_match(/\w+/, @tester.organization)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
