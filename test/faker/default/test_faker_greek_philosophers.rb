# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGreekPhilosophers < Test::Unit::TestCase
  def setup
    @tester = Faker::GreekPhilosophers
  end

  def test_name
    assert_match(/\w+/, @tester.name)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
