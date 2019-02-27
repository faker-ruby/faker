# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJojosBizarreAdventure < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::JojosBizarreAdventure
  end

  def test_protagonist
    assert @tester.protagonist.match(/\w+\.?/)
  end

  def test_antagonist
    assert @tester.antagonist.match(/\w+\.?/)
  end

  def test_ally
    assert @tester.ally.match(/\w+\.?/)
  end

  def test_stand
    assert @tester.stand.match(/\w+\.?/)
  end

  def test_quote
    assert @tester.quote.match(/\w+\.?/)
  end
end
