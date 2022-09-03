# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerOpera < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Opera
  end

  def verdi
    assert_match @tester.verdi, /\w+/i
  end

  def rossini
    assert_match @tester.rossini, /\w+/i
  end

  def donizetti
    assert_match @tester.donizetti, /\w+/i
  end

  def bellini
    assert_match @tester.bellini, /\w+/i
  end

  def mozart
    assert_match @tester.mozart, /\w+/i
  end

  def mozart_italian
    assert_match @tester.mozart_italian, /\w+/i
  end

  def mozart_german
    assert_match @tester.mozart_german, /\w+/i
  end

  def gluck
    assert_match @tester.gluck, /\w+/i
  end

  def gluck_italian
    assert_match @tester.gluck_italian, /\w+/i
  end

  def gluck_french
    assert_match @tester.gluck_french, /\w+/i
  end

  def beethoven
    assert_match @tester.beethoven, /\w+/i
  end

  def weber
    assert_match @tester.weber, /\w+/i
  end

  def strauss
    assert_match @tester.strauss, /\w+/i
  end

  def wagner
    assert_match @tester.wagner, /\w+/i
  end

  def schumann
    assert_match @tester.schumann, /\w+/i
  end

  def schubert
    assert_match @tester.schubert, /\w+/i
  end

  def berg
    assert_match @tester.berg, /\w+/i
  end

  def ravel
    assert_match @tester.ravel, /\w+/i
  end

  def berlioz
    assert_match @tester.berlioz, /\w+/i
  end

  def bizet
    assert_match @tester.bizet, /\w+/i
  end

  def gounod
    assert_match @tester.gounod, /\w+/i
  end

  def saint_saens
    assert_match @tester.saint_saens, /\w+/i
  end
end
