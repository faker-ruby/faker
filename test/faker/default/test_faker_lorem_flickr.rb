# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerLoremFlickr < Test::Unit::TestCase
  def setup
    @tester = Faker::LoremFlickr
    @colorizations = %w[red green blue]
  end

  def test_image
    assert_equal('https://loremflickr.com/300/300', @tester.image)
  end

  def test_image_with_size
    assert_equal('https://loremflickr.com/50/60', @tester.image(size: '50x60'))
  end

  def test_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.image(size: '300x300s')
    end
  end

  def test_image_with_single_search_term
    assert_equal('https://loremflickr.com/50/60/faker', @tester.image(size: '50x60', search_terms: %w[faker]))
  end

  def test_image_with_multiple_search_terms
    assert_equal('https://loremflickr.com/50/60/dog,cat', @tester.image(size: '50x60', search_terms: %w[dog cat]))
  end

  def test_image_with_search_terms_and_match_all
    assert_equal('https://loremflickr.com/50/60/dog,cat/all', @tester.image(size: '50x60', search_terms: %w[dog cat], match_all: true))
  end

  def test_grayscale_image
    @tester.grayscale_image == 'https://loremflickr.com/g/300/300/all'
  end

  def test_grayscale_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.grayscale_image(size: '300x300s')
    end
  end

  def test_grayscale_image_without_search_terms
    @tester.grayscale_image(size: '50x60') == 'https://loremflickr.com/g/50/60/all'
  end

  def test_grayscale_image_with_single_search_term
    assert_equal('https://loremflickr.com/g/50/60/faker', @tester.grayscale_image(size: '50x60', search_terms: %w[faker]))
  end

  def test_grayscale_image_with_multiple_search_terms
    assert_equal('https://loremflickr.com/g/50/60/dog,cat', @tester.grayscale_image(size: '50x60', search_terms: %w[dog cat]))
  end

  def test_grayscale_image_with_search_terms_and_match_all
    assert_equal('https://loremflickr.com/g/50/60/dog,cat/all', @tester.grayscale_image(size: '50x60', search_terms: %w[dog cat], match_all: true))
  end

  def test_pixelated_image
    @tester.pixelated_image == 'https://loremflickr.com/p/300/300/all'
  end

  def test_pixelated_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.pixelated_image(size: '300x300s')
    end
  end

  def test_pixelated_image_without_search_terms
    @tester.pixelated_image(size: '50x60') == 'https://loremflickr.com/p/50/60/all'
  end

  def test_pixelated_image_with_single_search_term
    assert_equal('https://loremflickr.com/p/50/60/faker', @tester.pixelated_image(size: '50x60', search_terms: %w[faker]))
  end

  def test_pixelated_image_with_multiple_search_terms
    assert_equal('https://loremflickr.com/p/50/60/dog,cat', @tester.pixelated_image(size: '50x60', search_terms: %w[dog cat]))
  end

  def test_pixelated_image_with_search_terms_and_match_all
    assert_equal('https://loremflickr.com/p/50/60/dog,cat/all', @tester.pixelated_image(size: '50x60', search_terms: %w[dog cat], match_all: true))
  end

  def test_colorized_image
    @tester.colorized_image == 'https://loremflickr.com/red/300/300/all'
  end

  def test_colorized_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.colorized_image(size: '300x300s')
    end
  end

  def test_colorized_image_without_search_terms
    @tester.colorized_image(size: '50x60', color: 'red') == 'https://loremflickr.com/red/50/60/all'
  end

  def test_colorized_image_with_unsupported_colorization
    assert_raise ArgumentError do
      @tester.colorized_image(size: '50x60', color: 'yellow')
    end
  end

  def test_colorized_image_with_single_search_term
    @colorizations.each do |colorization|
      assert_equal @tester.colorized_image(size: '50x60', color: colorization, search_terms: %w[faker]), "https://loremflickr.com/#{colorization}/50/60/faker"
    end
  end

  def test_colorized_image_with_multiple_search_terms
    @colorizations.each do |colorization|
      assert_equal @tester.colorized_image(size: '50x60', color: colorization, search_terms: %w[dog cat]), "https://loremflickr.com/#{colorization}/50/60/dog,cat"
    end
  end

  def test_colorized_image_with_search_terms_and_match_all
    @colorizations.each do |colorization|
      assert_equal @tester.colorized_image(size: '50x60', color: colorization, search_terms: %w[dog cat], match_all: true), "https://loremflickr.com/#{colorization}/50/60/dog,cat/all"
    end
  end
end
