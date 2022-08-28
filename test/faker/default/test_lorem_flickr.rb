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

  def test_image_with_search_terms
    assert @tester.image(size: '300x300', search_terms: ['sports', 'fitness']).match(%r{https://loremflickr\.com/\d+/\d+/(.+\,.+)})[1] == 'sports,fitness'
  end

  def test_image_with_search_terms_and_match_all
    assert @tester.image(size: '300x300', search_terms: ['sports', 'fitness'], match_all: true).match(%r{https://loremflickr\.com/\d+/\d+/.+\,.+/(all)})[1] == 'all'
  end
end