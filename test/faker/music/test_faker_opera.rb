# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerOpera < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Opera
  end

  def test_verdi
    assert_match(/\w+/i, @tester.verdi)
  end

  def test_rossini
    assert_match(/\w+/i, @tester.rossini)
  end

  def test_donizetti
    assert_match(/\w+/i, @tester.donizetti)
  end

  def test_bellini
    assert_match(/\w+/i, @tester.bellini)
  end

  def test_mozart
    assert_match(/\w+/i, @tester.mozart)
  end

  def test_mozart_italian
    assert_match(/\w+/i, @tester.mozart_italian)
  end

  def test_mozart_german
    assert_match(/\w+/i, @tester.mozart_german)
  end

  def test_gluck
    assert_match(/\w+/i, @tester.gluck)
  end

  def test_gluck_italian
    assert_match(/\w+/i, @tester.gluck_italian)
  end

  def test_gluck_french
    assert_match(/\w+/i, @tester.gluck_french)
  end

  def test_beethoven
    assert_match(/\w+/i, @tester.beethoven)
  end

  def test_weber
    assert_match(/\w+/i, @tester.weber)
  end

  def test_strauss
    assert_match(/\w+/i, @tester.strauss)
  end

  def test_wagner
    assert_match(/\w+/i, @tester.wagner)
  end

  def test_schumann
    assert_match(/\w+/i, @tester.schumann)
  end

  def test_schubert
    assert_match(/\w+/i, @tester.schubert)
  end

  def test_berg
    assert_match(/\w+/i, @tester.berg)
  end

  def test_ravel
    assert_match(/\w+/i, @tester.ravel)
  end

  def test_berlioz
    assert_match(/\w+/i, @tester.berlioz)
  end

  def test_bizet
    assert_match(/\w+/i, @tester.bizet)
  end

  def test_gounod
    assert_match(/\w+/i, @tester.gounod)
  end

  def test_saint_saens
    assert_match(/\w+/i, @tester.saint_saens)
  end
end
