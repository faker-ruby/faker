# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsFuturama < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Futurama
  end

  def test_characters
    10.times { assert @tester.character.match(/\w+/) }
  end

  def test_locations
    10.times { assert @tester.location.match(/\w+/) }
  end

  def test_quote
    10.times { assert @tester.quote.match(/\w+/) }
  end

  def test_hermes_catchphrases
    10.times { assert @tester.hermes_catchphrase.match(/\w+/) }
  end
end
