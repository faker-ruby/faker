# frozen_string_literal: true

require_relative 'test_helper'

class TestDeprecateWitcher < Test::Unit::TestCase
  def setup
    @witcher = Faker::Witcher
  end

  def test_character
    assert @witcher.character.match(/\w+/)
  end

  def test_location
    assert @witcher.location.match(/\w+/)
  end

  def test_school
    assert @witcher.school.match(/\w+/)
  end

  def test_witcher
    assert @witcher.witcher.match(/\w+/)
  end

  def test_monster
    assert @witcher.monster.match(/\w+/)
  end

  def test_quote
    assert @witcher.quote.match(/\w+/)
  end
end
