# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTurkey < Test::Unit::TestCase
  def setup
    @tester = Faker::Turkey
  end

  def test_valid_id_number
    assert @tester.valid_id_number.match(/\A[a-z0-9]{11}\z/)
  end

  def test_invalid_id_number
    assert @tester.invalid_id_number.match(/\A[a-z0-9]{11}\z/)
  end

  def test_valid_tax_number
    assert @tester.valid_tax_number.match(/\A[a-z0-9]{10}\z/)
  end

  def test_invalid_tax_number
    assert @tester.invalid_tax_number.match(/\A[a-z0-9]{10}\z/)
  end
end
