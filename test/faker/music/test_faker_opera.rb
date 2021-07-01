# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerOpera < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Opera
  end

  def verdi
    assert @tester.verdi.match(/\w+/i)
  end

  def rossini
    assert @tester.rossini.match(/\w+/i)
  end

  def donizetti
    assert @tester.donizetti.match(/\w+/i)
  end

  def bellini
    assert @tester.bellini.match(/\w+/i)
  end

  def mozart
    assert @tester.mozart.match(/\w+/i)
  end

  def mozart_italian
    assert @tester.mozart_italian.match(/\w+/i)
  end

  def mozart_german
    assert @tester.mozart_german.match(/\w+/i)
  end

  def gluck
    assert @tester.gluck.match(/\w+/i)
  end

  def gluck_italian
    assert @tester.gluck_italian.match(/\w+/i)
  end

  def gluck_french
    assert @tester.gluck_french.match(/\w+/i)
  end

  def beethoven
    assert @tester.beethoven.match(/\w+/i)
  end

  def weber
    assert @tester.weber.match(/\w+/i)
  end

  def strauss
    assert @tester.strauss.match(/\w+/i)
  end

  def wagner
    assert @tester.wagner.match(/\w+/i)
  end

  def schumann
    assert @tester.schumann.match(/\w+/i)
  end

  def schubert
    assert @tester.schubert.match(/\w+/i)
  end

  def berg
    assert @tester.berg.match(/\w+/i)
  end

  def ravel
    assert @tester.ravel.match(/\w+/i)
  end

  def berlioz
    assert @tester.berlioz.match(/\w+/i)
  end

  def bizet
    assert @tester.bizet.match(/\w+/i)
  end

  def gounod
    assert @tester.gounod.match(/\w+/i)
  end

  def saint_saens
    assert @tester.saint_saens.match(/\w+/i)
  end
end
