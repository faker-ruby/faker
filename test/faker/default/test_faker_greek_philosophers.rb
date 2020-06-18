# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGreekPhilosophers < Test::Unit::TestCase
  def setup
    @tester = Faker::GreekPhilosophers
  end

  def test_name
    assert @tester.name.match?(/\w+/)
  end

  def test_quote
    assert @tester.quote.match?(/\w+/)
  end
end
