# frozen_string_literal: true

require_relative '../test_helper'

class TestDeprecateBreakingBad < Test::Unit::TestCase
  def setup
    @tester = Faker::BreakingBad
  end

  def test_character
    10.times { assert @tester.character.match(/[\w]+/) }
  end

  def test_episode
    10.times { assert @tester.episode.match(/[\w]+/) }
  end
end
