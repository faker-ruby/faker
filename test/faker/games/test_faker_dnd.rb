# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDnD < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::DnD
  end

  def test_species
    assert @tester.species.match(/\w+/)
  end

  def test_klass
    assert @tester.klass.match(/\w+/)
  end

  def test_background
    assert @tester.background.match(/\w+/)
  end

  def test_alignment
    assert @tester.alignment.match(/\w+/)
  end
end
