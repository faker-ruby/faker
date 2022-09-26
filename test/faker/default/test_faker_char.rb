# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerChar < Test::Unit::TestCase
  def setup
    @tester = Faker::Char
  end

  def test_fix_umlauts
    assert_equal('ae', @tester.fix_umlauts('ä'))
    assert_equal('oe', @tester.fix_umlauts('ö'))
    assert_equal('ue', @tester.fix_umlauts('ü'))
    assert_equal('ss', @tester.fix_umlauts('ß'))
    # tests false positive
    assert_equal('ss', @tester.fix_umlauts('ss'))
  end
end
