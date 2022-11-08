# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAirport < Test::Unit::TestCase
  def setup
    @tester = Faker::Travel::Airport
  end

  def name
    assert_match(/\w+/, @tester.name)
  end

  def iata
    assert_match(/\w+/, @tester.iata)
  end
end
