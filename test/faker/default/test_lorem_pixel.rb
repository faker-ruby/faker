# frozen_string_literal: true

require_relative '../../test_helper'

class TestLoremPixel < Test::Unit::TestCase
  def setup
    @tester = Faker::LoremPixel
  end

  def test_lorempixel
    assert !@tester.image.match(%r{https://lorempixel\.com/(\d+/\d+)})[1].nil?
  end

  def test_lorempixel_insecure
    assert !@tester.image(size: '300x300', is_gray: nil, category: nil, number: nil, text: nil, secure: false).match(%r{http://lorempixel\.com/(\d+/\d+)})[1].nil?
  end

  def test_image_with_custom_size
    assert @tester.image(size: '3x3').match(%r{https://lorempixel\.com/(\d+/\d+)})[1] == '3/3'
  end

  def test_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.image(size: '300x300s')
    end
  end

  def test_image_gray
    assert @tester.image(size: '300x300', is_gray: true).match(%r{https://lorempixel\.com/g/\d+/\d+})
  end

  def test_image_with_supported_category
    assert @tester.image(size: '300x300', is_gray: false, category: 'animals').match(%r{https://lorempixel\.com/\d+/\d+/(.*)})[1] == 'animals'
  end

  def test_image_with_incorrect_category
    assert_raise ArgumentError do
      @tester.image(size: '300x300', is_gray: false, category: 'wrong_category')
    end
  end

  def test_image_with_supported_category_and_correct_number
    assert @tester.image(size: '300x300', is_gray: false, category: 'animals', number: 3).match(%r{https://lorempixel\.com/\d+/\d+/.+/(\d+)})[1] == '3'
  end

  def test_image_with_supported_category_and_incorrect_number
    assert_raise ArgumentError do
      @tester.image(size: '300x300', is_gray: false, category: 'animals', number: 11)
    end
  end

  def test_image_with_correct_number_and_without_category
    assert_raise ArgumentError do
      @tester.image(size: '300x300', is_gray: false, category: 'wrong_category', number: 3)
    end
  end

  def test_image_with_text_correct_number_and_supported_category
    assert @tester.image(size: '300x300', is_gray: false, category: 'animals', number: 3, text: 'Dummy-text').match(%r{https://lorempixel\.com/\d+/\d+/.+/3/(.+)})[1] == 'Dummy-text'
  end

  def test_image_with_text_supported_category_and_text_without_number
    assert @tester.image(size: '300x300', is_gray: false, category: 'animals', number: nil, text: 'Dummy-text').match(%r{https://lorempixel\.com/\d+/\d+/.+/(.+)})[1] == 'Dummy-text'
  end

  def test_image_with_text_without_number_and_category
    assert_raise ArgumentError do
      @tester.image(size: '300x300', is_gray: false, category: nil, number: nil, text: 'Dummy-text')
    end
  end
end
