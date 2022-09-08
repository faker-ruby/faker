# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerKpop < Test::Unit::TestCase
  def setup
    @tester = Faker::Kpop
  end

  def test_i_groups
    assert_match(/\w+/, @tester.i_groups)
  end

  def test_ii_groups
    assert_match(/\w+/, @tester.ii_groups)
  end

  def test_iii_groups
    assert_match(/\w+/, @tester.iii_groups)
  end

  def test_girl_groups
    assert_match(/\w+/, @tester.girl_groups)
  end

  def test_boy_bands
    assert_match(/\w+/, @tester.boy_bands)
  end

  def test_solo
    assert_match(/\w+/, @tester.solo)
  end
end
