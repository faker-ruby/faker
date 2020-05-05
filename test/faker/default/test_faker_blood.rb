# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBlood < Test::Unit::TestCase
  def setup
    @tester = Faker::Blood
  end

  def test_type
    assert @tester.type.match(/^(AB|A|B|O)$/)
  end

  def test_rh_factor
    assert @tester.rh_factor.match(/[+-]/)
  end

  def test_group
    assert @tester.group.match(/^(AB|A|B|O)[+-]$/)
  end
end
