# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFillmurray < Test::Unit::TestCase
  def setup
    @tester = Faker::Fillmurray
  end

  def test_fillmurray
    assert !@tester.image(false, '300', '300').match(%r{https:\/\/fillmurray\.com\/(\d+)\/(\d+)}).nil?
  end

  def test_fillmurray_with_grayscale
    assert @tester.image(true, '300', '300').match(%r{https:\/\/fillmurray\.com\/(g?\/?)(\d+)\/(\d+)})[1] == 'g/'
  end

  def test_fillmurray_with_incorrect_height_format
    assert_raise ArgumentError do
      @tester.image(false, '300', 'nine-thousand')
    end
  end

  def test_fillmurray_with_incorrect_width_format
    assert_raise ArgumentError do
      @tester.image(false, 'three-hundred')
    end
  end

  def test_fillmurray_with_incorrect_grayscale
    assert_raise ArgumentError do
      @tester.image('gray', '300', '400')
    end
  end
end
