# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerWitcher < Test::Unit::TestCase
  def setup
    @witcher = Faker::Games::Witcher
  end

  def test_character
    assert_match @witcher.character, /\w+/
  end

  def test_location
    assert_match @witcher.location, /\w+/
  end

  def test_school
    assert_match @witcher.school, /\w+/
  end

  def test_witcher
    assert_match @witcher.witcher, /\w+/
  end

  def test_monster
    assert_match @witcher.monster, /\w+/
  end

  def test_quote
    assert_match @witcher.quote, /\w+/
  end

  def test_sign
    assert_match @witcher.sign, /\w+/
  end

  def test_potion
    assert_match @witcher.potion, /\w+/
  end

  def test_book
    assert_match @witcher.book, /\w+/
  end
end
