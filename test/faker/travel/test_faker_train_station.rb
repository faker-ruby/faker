# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTrainStation < Test::Unit::TestCase
  def setup
    @tester = Faker::Travel::TrainStation
  end

  def test_name_uk
    assert_match(/\w+/, @tester.name(type: 'metro', region: 'united_kingdom'))
    assert_match(/\w+/, @tester.name(type: 'metro', region: 'United_Kingdom'))
    assert_match(/\w+/, @tester.name(type: 'metro', region: :united_kingdom))
    assert_match(/\w+/, @tester.name(type: 'metro', region: :United_Kingdom))
  end

  def test_name_esp
    assert_match(/\w+/, @tester.name(type: 'railway', region: 'spain'))
  end

  def test_name_us
    assert_match(/\w+/, @tester.name(type: 'metro', region: 'united_states'))
  end

  def test_name_no_args
    assert_match(/\w+/, @tester.name)
  end

  def test_region_only
    assert_match(/\w+/, @tester.name(region: 'germany'))
    assert_match(/\w+/, @tester.name(region: 'Germany'))
    assert_match(/\w+/, @tester.name(region: :Germany))
  end

  def test_type_only
    assert_match(/\w+/, @tester.name(type: :metro))
    assert_match(/\w+/, @tester.name(type: :railway))
    assert_match(/\w+/, @tester.name(type: 'railway'))
  end

  def test_name_with_invalid_arguments
    assert_raises ArgumentError do
      @tester.name(bee: 'bzzz', fish: 'blub')
    end
  end
end
