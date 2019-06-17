# frozen_string_literal: true

require_relative '../../test_helper'

class TestDeprecateSpace < Test::Unit::TestCase
  def setup
    @tester = Faker::Space
  end

  def launch_vehicule
    assert @tester.character.match(/\w+/)
  end
end
