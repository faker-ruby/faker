# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFillmurray < Test::Unit::TestCase
  def setup
    @tester = Faker::Fillmurray
  end

  def test_fillmurray
    Gem::Deprecate.skip_during do
      refute_nil @tester.image(grayscale: false, width: '300', height: '300').match(%r{https://www\.fillmurray\.com/(\d+)/(\d+)})
    end
  end

  def test_image_deprecation_message
    _out, err = capture_output do
      @tester.image(grayscale: false, width: '300', height: '300')
    end

    assert_match(/Faker::Fillmurray.image is deprecated; use Faker::LoremFlickr.image instead\./, err)
  end

  def test_fillmurray_with_grayscale
    Gem::Deprecate.skip_during do
      assert_equal('g/', @tester.image(grayscale: true, width: '300', height: '300').match(%r{https://www\.fillmurray\.com/(g?/?)(\d+)/(\d+)})[1])
    end
  end

  def test_fillmurray_with_incorrect_height_format
    Gem::Deprecate.skip_during do
      assert_raise ArgumentError do
        @tester.image(grayscale: false, width: '300', height: 'nine-thousand')
      end
    end
  end

  def test_fillmurray_with_incorrect_width_format
    Gem::Deprecate.skip_during do
      assert_raise ArgumentError do
        @tester.image(grayscale: false, width: 'three-hundred')
      end
    end
  end

  def test_fillmurray_with_incorrect_grayscale
    Gem::Deprecate.skip_during do
      assert_raise ArgumentError do
        @tester.image(grayscale: 'gray', width: '300', height: '400')
      end
    end
  end
end
