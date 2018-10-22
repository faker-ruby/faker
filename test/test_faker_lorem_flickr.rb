# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerLoremFlickr < Test::Unit::TestCase
  def setup
    @tester = Faker::LoremFlickr
    @colorizations = %w[red green blue]
  end

  def test_image
    assert_match(/http:\/\/loremflickr\.com\/300\/300\/\?random=\d{1,3}/, @tester.image)
  end

  def test_image_with_size
    assert_match(/http:\/\/loremflickr\.com\/50\/60\/\?random=\d{1,3}/, @tester.image('50x60'))
  end

  def test_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.image('300x300s')
    end
  end

  def test_image_with_single_search_term
    assert_match(/http:\/\/loremflickr\.com\/50\/60\/faker\/\?random=\d{1,3}/, @tester.image('50x60', %w[faker]))
  end

  def test_image_with_multiple_search_terms
    assert_match(/http:\/\/loremflickr\.com\/50\/60\/dog,cat\/\?random=\d{1,3}/, @tester.image('50x60', %w[dog cat]))
  end

  def test_image_with_search_terms_and_match_all
    assert_match(/http:\/\/loremflickr\.com\/50\/60\/dog,cat\/all\/\?random=\d{1,3}/, @tester.image('50x60', %w[dog cat], true))
  end

  def test_image_with_search_terms_and_match_all_and_no_random
    assert @tester.image('50x60', %w[dog cat], true, false) == 'http://loremflickr.com/50/60/dog,cat/all'
  end

  def test_grayscale_image
    @tester.grayscale_image == "http://loremflickr.com/g/300/300/all/?random=#{/\d{1,3}/}"
  end

  def test_grayscale_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.grayscale_image('300x300s')
    end
  end

  def test_grayscale_image_without_search_terms
    assert_match(/http:\/\/loremflickr\.com\/g\/50\/60\/all\/\?random=\d{1,3}/, @tester.grayscale_image('50x60'))
  end

  def test_grayscale_image_with_single_search_term
    assert_match(/http:\/\/loremflickr\.com\/g\/50\/60\/faker\/\?random=\d{1,3}/, @tester.grayscale_image('50x60', %w[faker]))
  end

  def test_grayscale_image_with_multiple_search_terms
    assert_match(/http:\/\/loremflickr\.com\/g\/50\/60\/dog,cat\/\?random=\d{1,3}/, @tester.grayscale_image('50x60', %w[dog cat]))
  end

  def test_grayscale_image_with_search_terms_and_match_all
    assert_match(/http:\/\/loremflickr\.com\/g\/50\/60\/dog,cat\/all\/\?random=\d{1,3}/, @tester.grayscale_image('50x60', %w[dog cat], true))
  end

  def test_grayscale_image_with_search_terms_and_match_all_and_no_random
    assert @tester.grayscale_image('50x60', %w[dog cat], true, false) == 'http://loremflickr.com/g/50/60/dog,cat/all'
  end

  def test_pixelated_image
    assert_match(/http:\/\/loremflickr\.com\/p\/300\/300\/all\/\?random=\d{1,3}/, @tester.pixelated_image)
  end

  def test_pixelated_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.pixelated_image('300x300s')
    end
  end

  def test_pixelated_image_without_search_terms
    assert_match(/http:\/\/loremflickr\.com\/p\/50\/60\/all\/\?random=\d{1,3}/, @tester.pixelated_image('50x60'))
  end

  def test_pixelated_image_with_single_search_term
    assert_match(/http:\/\/loremflickr\.com\/p\/50\/60\/faker\/\?random=\d{1,3}/, @tester.pixelated_image('50x60', %w[faker]))
  end

  def test_pixelated_image_with_multiple_search_terms
    assert_match(/http:\/\/loremflickr\.com\/p\/50\/60\/dog,cat\/\?random=\d{1,3}/, @tester.pixelated_image('50x60', %w[dog cat]))
  end

  def test_pixelated_image_with_search_terms_and_match_all
    assert_match(/http:\/\/loremflickr\.com\/p\/50\/60\/dog,cat\/all\/\?random=\d{1,3}/, @tester.pixelated_image('50x60', %w[dog cat], true))
  end

  def test_colorized_image
    assert_match(/http:\/\/loremflickr\.com\/red\/300\/300\/all\/\?random=\d{1,3}/, @tester.colorized_image)
  end

  def test_colorized_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.colorized_image('300x300s')
    end
  end

  def test_colorized_image_without_search_terms
    assert_match(/http:\/\/loremflickr\.com\/red\/50\/60\/all\/\?random=\d{1,3}/, @tester.colorized_image('50x60', 'red'))
  end

  def test_colorized_image_with_unsupported_colorization
    assert_raise ArgumentError do
      @tester.colorized_image('50x60', 'yellow')
    end
  end

  def test_colorized_image_with_single_search_term
    @colorizations.each do |colorization|
      assert_match(/http:\/\/loremflickr\.com\/#{colorization}\/50\/60\/faker\/\?random=\d{1,3}/, @tester.colorized_image('50x60', colorization, %w[faker]))
    end
  end

  def test_colorized_image_with_multiple_search_terms
    @colorizations.each do |colorization|
      assert_match(/http:\/\/loremflickr\.com\/#{colorization}\/50\/60\/dog,cat\/\?random=\d{1,3}/, @tester.colorized_image('50x60', colorization, %w[dog cat]))
    end
  end

  def test_colorized_image_with_search_terms_and_match_all
    @colorizations.each do |colorization|
      assert_match(/http:\/\/loremflickr\.com\/#{colorization}\/50\/60\/dog,cat\/all\/\?random=\d{1,3}/, @tester.colorized_image('50x60', colorization, %w[dog cat], true))
    end
  end

  def test_colorized_image_with_search_terms_and_match_all_and_no_random
    @colorizations.each do |colorization|
      assert @tester.colorized_image('50x60', colorization, %w[dog cat], true, false) == "http://loremflickr.com/#{colorization}/50/60/dog,cat/all"
    end
  end
end
