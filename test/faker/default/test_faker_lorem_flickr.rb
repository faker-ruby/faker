# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerLoremFlickr < Test::Unit::TestCase
  def setup
    @tester = Faker::LoremFlickr
    @colorizations = %w[red green blue]
  end

  def test_image
    assert @tester.image == 'http://loremflickr.com/300/300'
  end

  def test_image_with_size
    assert @tester.image('50x60') == 'http://loremflickr.com/50/60'
  end

  def test_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.image('300x300s')
    end
  end

  def test_image_with_single_search_term
    assert @tester.image('50x60', %w[faker]) == 'http://loremflickr.com/50/60/faker'
  end

  def test_image_with_multiple_search_terms
    assert @tester.image('50x60', %w[dog cat]) == 'http://loremflickr.com/50/60/dog,cat'
  end

  def test_image_with_search_terms_and_match_all
    assert @tester.image('50x60', %w[dog cat], true) == 'http://loremflickr.com/50/60/dog,cat/all'
  end

  def test_grayscale_image
    @tester.grayscale_image == 'http://loremflickr.com/g/300/300/all'
  end

  def test_grayscale_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.grayscale_image('300x300s')
    end
  end

  def test_grayscale_image_without_search_terms
    @tester.grayscale_image('50x60') == 'http://loremflickr.com/g/50/60/all'
  end

  def test_grayscale_image_with_single_search_term
    assert @tester.grayscale_image('50x60', %w[faker]) == 'http://loremflickr.com/g/50/60/faker'
  end

  def test_grayscale_image_with_multiple_search_terms
    assert @tester.grayscale_image('50x60', %w[dog cat]) == 'http://loremflickr.com/g/50/60/dog,cat'
  end

  def test_grayscale_image_with_search_terms_and_match_all
    assert @tester.grayscale_image('50x60', %w[dog cat], true) == 'http://loremflickr.com/g/50/60/dog,cat/all'
  end

  def test_pixelated_image
    @tester.pixelated_image == 'http://loremflickr.com/p/300/300/all'
  end

  def test_pixelated_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.pixelated_image('300x300s')
    end
  end

  def test_pixelated_image_without_search_terms
    @tester.pixelated_image('50x60') == 'http://loremflickr.com/p/50/60/all'
  end

  def test_pixelated_image_with_single_search_term
    assert @tester.pixelated_image('50x60', %w[faker]) == 'http://loremflickr.com/p/50/60/faker'
  end

  def test_pixelated_image_with_multiple_search_terms
    assert @tester.pixelated_image('50x60', %w[dog cat]) == 'http://loremflickr.com/p/50/60/dog,cat'
  end

  def test_pixelated_image_with_search_terms_and_match_all
    assert @tester.pixelated_image('50x60', %w[dog cat], true) == 'http://loremflickr.com/p/50/60/dog,cat/all'
  end

  def test_colorized_image
    @tester.colorized_image == 'http://loremflickr.com/red/300/300/all'
  end

  def test_colorized_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.colorized_image('300x300s')
    end
  end

  def test_colorized_image_without_search_terms
    @tester.colorized_image('50x60', 'red') == 'http://loremflickr.com/red/50/60/all'
  end

  def test_colorized_image_with_unsupported_colorization
    assert_raise ArgumentError do
      @tester.colorized_image('50x60', 'yellow')
    end
  end

  def test_colorized_image_with_single_search_term
    @colorizations.each do |colorization|
      assert @tester.colorized_image('50x60', colorization, %w[faker]) == "http://loremflickr.com/#{colorization}/50/60/faker"
    end
  end

  def test_colorized_image_with_multiple_search_terms
    @colorizations.each do |colorization|
      assert @tester.colorized_image('50x60', colorization, %w[dog cat]) == "http://loremflickr.com/#{colorization}/50/60/dog,cat"
    end
  end

  def test_colorized_image_with_search_terms_and_match_all
    @colorizations.each do |colorization|
      assert @tester.colorized_image('50x60', colorization, %w[dog cat], true) == "http://loremflickr.com/#{colorization}/50/60/dog,cat/all"
    end
  end
end
