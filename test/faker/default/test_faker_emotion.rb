# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerEmotion < Test::Unit::TestCase
  def setup
    @tester = Faker::Emotion
  end

  def test_noun
    assert @tester.noun.match(/\w+/)
  end

  def test_adjective
    assert @tester.adjective.match(/\w+/)
  end
end
