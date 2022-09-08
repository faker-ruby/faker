# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerEmotion < Test::Unit::TestCase
  def setup
    @tester = Faker::Emotion
  end

  def test_noun
    assert_match(/\w+/, @tester.noun)
  end

  def test_adjective
    assert_match(/\w+/, @tester.adjective)
  end
end
