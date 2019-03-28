# frozen_string_literal: true

require_relative '../../test_helper'

class TestDeprecateRockBand < Test::Unit::TestCase
  def setup
    @tester = Faker::RockBand
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end
end
