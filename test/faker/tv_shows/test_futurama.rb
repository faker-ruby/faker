# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsFuturama < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Futurama
  end

  def test_characters
    10.times { assert_match @tester.character, /\w+/ }
  end

  def test_locations
    10.times { assert_match @tester.location, /\w+/ }
  end

  def test_quote
    10.times { assert_match @tester.quote, /\w+/ }
  end

  def test_hermes_catchphrases
    10.times { assert_match @tester.hermes_catchphrase, /\w+/ }
  end
end
