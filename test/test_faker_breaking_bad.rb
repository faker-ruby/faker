# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class TestFakerBreakingBad < Test::Unit::TestCase
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
