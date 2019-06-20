# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerOpera < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::InstrumentModel
  end

  def name
    assert @tester.name.match(/\w+/i)
  end

  def company
    assert @tester.company.match(/\w+/i)
  end
end
