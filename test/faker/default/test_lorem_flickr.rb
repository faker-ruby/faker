# frozen_string_literal: true

require_relative '../../test_helper'

class TestLoremFlickr < Test::Unit::TestCase
  def setup
    @tester = Faker::LoremFlickr
  end

  def test_loremflickr
    assert !@tester.image.match(%r{https://loremflickr\.com/(\d+/\d+)})[1].nil?
  end

  def test_image_with_custom_size
    assert @tester.image(size: '3x3').match(%r{https://loremflickr\.com/(\d+/\d+)})[1] == '3/3'
  end

  def test_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.image(size: '300x300s')
    end
  end

  def test_image_with_single_search_term
    assert @tester.image(size: '300x300', search_terms: ['sports']).match(%r{https://loremflickr\.com/\d+/\d+/(.+)})[1] == 'sports'
  end

  def test_image_with_multiple_search_terms
    assert @tester.image(size: '300x300', search_terms: %w[sports fitness]).match(%r{https://loremflickr\.com/\d+/\d+/(.+,.+)})[1] == 'sports,fitness'
  end

  def test_image_with_search_terms_and_match_all
    assert @tester.image(size: '300x300', search_terms: %w[sports fitness], match_all: true).match(%r{https://loremflickr\.com/\d+/\d+/.+,.+/(.+)})[1] == 'all'
  end

  def test_grayscale_image
    assert @tester.grayscale_image.match(%r{https://loremflickr\.com/g/\d+/\d+/.+})
  end

  def test_grayscale_image_with_custom_size
    assert @tester.grayscale_image(size: '3x3').match(%r{https://loremflickr\.com/.+/(\d+/\d+)/.+})[1] == '3/3'
  end

  def test_grayscale_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.grayscale_image(size: '300x300s')
    end
  end

  def test_grayscale_image_with_single_search_term
    assert @tester.grayscale_image(size: '300x300', search_terms: ['sports']).match(%r{https://loremflickr\.com/.+/\d+/\d+/(.+)})[1] == 'sports'
  end

  def test_grayscale_image_with_multiple_search_terms
    assert @tester.grayscale_image(size: '300x300', search_terms: %w[sports fitness]).match(%r{https://loremflickr\.com/.+/\d+/\d+/(.+,.+)})[1] == 'sports,fitness'
  end

  def test_grayscale_image_without_search_terms
    assert_raise ArgumentError do
      assert @tester.grayscale_image(search_terms: [])
    end
  end

  def test_grayscale_image_with_search_terms_and_match_all
    assert @tester.grayscale_image(size: '300x300', search_terms: %w[sports fitness], match_all: true).match(%r{https://loremflickr\.com/.+/\d+/\d+/.+,.+/(.+)})[1] == 'all'
  end

  def test_pixelated_image
    assert @tester.pixelated_image.match(%r{https://loremflickr\.com/p/\d+/\d+/.+})
    # assert @tester.grayscale_image.match(%r{https://loremflickr\.com/g/\d+/\d+/.+})
  end

  def test_pixelated_image_with_custom_size
    assert @tester.pixelated_image(size: '3x3').match(%r{https://loremflickr\.com/.+/(\d+/\d+)/.+})[1] == '3/3'
  end

  def test_pixelated_image_with_incorrect_size
    assert_raise ArgumentError do
      assert @tester.pixelated_image(size: '300x300s')
    end
  end

  def test_pixelated_image_with_single_search_term
    assert @tester.pixelated_image(size: '300x300', search_terms: ['sports']).match(%r{https://loremflickr\.com/.+/\d+/\d+/(.+)})[1] == 'sports'
  end

  def test_pixelated_image_with_multiple_search_terms
    assert @tester.pixelated_image(size: '300x300', search_terms: %w[sports fitness]).match(%r{https://loremflickr\.com/.+/\d+/\d+/(.+,.+)})[1] == 'sports,fitness'
  end

  def test_pixelated_image_without_search_terms
    assert_raise ArgumentError do
      assert @tester.pixelated_image(search_terms: [])
    end
  end

  def test_pixelated_image_with_search_terms_and_match_all
    assert @tester.pixelated_image(size: '300x300', search_terms: %w[sports fitness], match_all: true).match(%r{https://loremflickr\.com/.+/\d+/\d+/.+,.+/(.+)})[1] == 'all'
  end
end
