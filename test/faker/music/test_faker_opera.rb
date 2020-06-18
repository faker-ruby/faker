# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerOpera < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Opera
  end

  def verdi
    assert @tester.verdi.match?(/\w+/i)
  end

  def rossini
    assert @tester.rossini.match?(/\w+/i)
  end

  def donizetti
    assert @tester.donizetti.match?(/\w+/i)
  end

  def bellini
    assert @tester.bellini.match?(/\w+/i)
  end
end
