# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFillmurray < Test::Unit::TestCase
  def setup
    @tester = Faker::Fillmurray
  end

  def test_fillmurray
    assert @tester.image(grayscale: false, width: '300', height: '300').match?(%r{https:\/\/www\.fillmurray\.com\/(\d+)\/(\d+)})
  end

  def test_fillmurray_with_grayscale
    assert @tester.image(grayscale: true, width: '300', height: '300').match(%r{https:\/\/www\.fillmurray\.com\/(g?\/?)(\d+)\/(\d+)})[1] == 'g/'
  end

  def test_fillmurray_with_incorrect_height_format
    assert_raise ArgumentError do
      @tester.image(grayscale: false, width: '300', height: 'nine-thousand')
    end
  end

  def test_fillmurray_with_incorrect_width_format
    assert_raise ArgumentError do
      @tester.image(grayscale: false, width: 'three-hundred')
    end
  end

  def test_fillmurray_with_incorrect_grayscale
    assert_raise ArgumentError do
      @tester.image(grayscale: 'gray', width: '300', height: '400')
    end
  end
end
