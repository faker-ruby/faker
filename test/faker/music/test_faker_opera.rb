# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerOpera < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Opera
  end

  def verdi
    assert_match(/\w+/i, @tester.verdi)
  end

  def rossini
    assert_match(/\w+/i, @tester.rossini)
  end

  def donizetti
    assert_match(/\w+/i, @tester.donizetti)
  end

  def bellini
    assert_match(/\w+/i, @tester.bellini)
  end

  def mozart
    assert_match(/\w+/i, @tester.mozart)
  end

  def mozart_italian
    assert_match(/\w+/i, @tester.mozart_italian)
  end

  def mozart_german
    assert_match(/\w+/i, @tester.mozart_german)
  end

  def gluck
    assert_match(/\w+/i, @tester.gluck)
  end

  def gluck_italian
    assert_match(/\w+/i, @tester.gluck_italian)
  end

  def gluck_french
    assert_match(/\w+/i, @tester.gluck_french)
  end

  def beethoven
    assert_match(/\w+/i, @tester.beethoven)
  end

  def weber
    assert_match(/\w+/i, @tester.weber)
  end

  def strauss
    assert_match(/\w+/i, @tester.strauss)
  end

  def wagner
    assert_match(/\w+/i, @tester.wagner)
  end

  def schumann
    assert_match(/\w+/i, @tester.schumann)
  end

  def schubert
    assert_match(/\w+/i, @tester.schubert)
  end

  def berg
    assert_match(/\w+/i, @tester.berg)
  end

  def ravel
    assert_match(/\w+/i, @tester.ravel)
  end

  def berlioz
    assert_match(/\w+/i, @tester.berlioz)
  end

  def bizet
    assert_match(/\w+/i, @tester.bizet)
  end

  def gounod
    assert_match(/\w+/i, @tester.gounod)
  end

  def saint_saens
    assert_match(/\w+/i, @tester.saint_saens)
  end
end
