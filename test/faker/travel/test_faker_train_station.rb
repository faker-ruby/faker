# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTrainStation < Test::Unit::TestCase
  def setup
    @tester = Faker::Travel::TrainStation
  end

  def test_name_uk
    assert_match(/\w+/, @tester.name(region: 'united_kingdom', type: 'metro'))
    assert_match(/\w+/, @tester.name(region: :united_kingdom, type: 'metro'))
  end

  def test_name_esp
    assert_match(/\w+/, @tester.name(region: 'spain', type: 'railway'))
  end

  def test_name_us
    assert_match(/\w+/, @tester.name(region: 'united_states', type: 'metro'))
  end

  def test_name_no_args
    assert_match(/\w+/, @tester.name)
  end

  def test_region_only
    assert_match(/\w+/, @tester.name(region: 'germany'))
    assert_match(/\w+/, @tester.name(region: 'united_states'))
  end

  def test_type_only
    assert_match(/\w+/, @tester.name(type: 'metro'))
    assert_match(/\w+/, @tester.name(type: 'railway'))
  end

  def test_name_with_invalid_arguments
    assert_raises ArgumentError do
      @tester.name(bee: 'bzzz', fish: 'blub')
    end
  end
end
