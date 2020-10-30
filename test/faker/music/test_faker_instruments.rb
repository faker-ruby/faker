# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMusicalInstruments < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::MusicalInstruments
  end

  def guitars
    assert @tester.common_guitars.match(/\w+/i)
  end

  def woodwinds
    assert @tester.common_woodwinds.match(/\w+/i)
  end

  def brass
    assert @tester.common_brass.match(/\w+/i)
  end

  def unpitched_percussion
    assert @tester.common_unpitched_percussion.match(/\w+/i)
  end

  def pitched_percussion
    assert @tester.common_unpitched_percussion.match(/\w+/i)
  end

  def keyboards
    assert @tester.common_keyboards.match(/\w+/i)
  end

  def strings
    assert @tester.common_strings.match(/\w+/i)
  end

  def singers
    assert @tester.common_singers.match(/\w+/i)
  end

  def uncommon_woodwinds
    assert @tester.uncommon_woodwinds.match(/\w+/i)
  end

  def uncommon_brass
    assert @tester.uncommon_brass.match(/\w+/i)
  end

  def uncommon_unpitched_percussion
    assert @tester.uncommon_unpitched_percussion.match(/\w+/i)
  end

  def uncommon_pitched_percussion
    assert @tester.uncommon_pitched_percussion.match(/\w+/i)
  end

  def uncommon_keyboards
    assert @tester.uncommon_keyboards.match(/\w+/i)
  end

  def uncommon_strings
    assert @tester.uncommon_strings.match(/\w+/i)
  end

  def uncommon_singers
    assert @tester.uncommon_singers.match(/\w+/i)
  end
end
