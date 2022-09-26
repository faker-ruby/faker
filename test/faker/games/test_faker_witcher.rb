# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerWitcher < Test::Unit::TestCase
  def setup
    @witcher = Faker::Games::Witcher
  end

  def test_character
    assert_match(/\w+/, @witcher.character)
  end

  def test_location
    assert_match(/\w+/, @witcher.location)
  end

  def test_school
    assert_match(/\w+/, @witcher.school)
  end

  def test_witcher
    assert_match(/\w+/, @witcher.witcher)
  end

  def test_monster
    assert_match(/\w+/, @witcher.monster)
  end

  def test_quote
    assert_match(/\w+/, @witcher.quote)
  end

  def test_sign
    assert_match(/\w+/, @witcher.sign)
  end

  def test_potion
    assert_match(/\w+/, @witcher.potion)
  end

  def test_book
    assert_match(/\w+/, @witcher.book)
  end
end
