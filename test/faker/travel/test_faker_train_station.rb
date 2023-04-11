# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTrainStation < Test::Unit::TestCase
  def setup
    @tester = Faker::Travel::TrainStation
  end

  def test_name
    assert_match(/\w+/, @tester.name(type: 'metro', region: 'united_kingdom'))
  end

  def test_name_with_invalid_arguments
    assert_raises ArgumentError do
      @tester.name(cats: 'meow', dogs: 'woof')
    end
  end
end
