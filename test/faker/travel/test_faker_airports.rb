# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAirport < Test::Unit::TestCase
  def setup
    @tester = Faker::Travel::Airport
  end

  def test_name
    assert_match(/\w+/, @tester.name(size: 'small', region: 'united_states'))
  end

  def test_iata
    assert_match(/\w+/, @tester.iata(size: 'small', region: 'united_states'))
  end

  def test_name_with_invalid_arguments
    assert_raises ArgumentError do
      @tester.name(cats: 'meow', dogs: 'woof')
    end
  end

  def test_iata_with_invalid_arguments
    assert_raises ArgumentError do
      @tester.iata(cats: 'meow', dogs: 'woof')
    end
  end
end
