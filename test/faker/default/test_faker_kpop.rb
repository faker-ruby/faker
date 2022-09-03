# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerKpop < Test::Unit::TestCase
  def setup
    @tester = Faker::Kpop
  end

  def test_i_groups
    assert_match @tester.i_groups, /\w+/
  end

  def test_ii_groups
    assert_match @tester.ii_groups, /\w+/
  end

  def test_iii_groups
    assert_match @tester.iii_groups, /\w+/
  end

  def test_girl_groups
    assert_match @tester.girl_groups, /\w+/
  end

  def test_boy_bands
    assert_match @tester.boy_bands, /\w+/
  end

  def test_solo
    assert_match @tester.solo, /\w+/
  end
end
