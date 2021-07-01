# frozen_string_literal: true

require_relative '../../test_helper'

class TestPlaceholdit < Test::Unit::TestCase
  def setup
    @tester = Faker::Placeholdit
  end

  def test_placeholdit
    assert !@tester.image.match(%r{https://placehold\.it/(.+)(png?)})[1].nil?
  end

  def test_avatar_with_custom_size
    assert @tester.image(size: '3x3').match(%r{https://placehold\.it/+(\d+x\d+)})[1] == '3x3'
  end

  def test_avatar_with_incorrect_size
    assert_raise ArgumentError do
      @tester.image(size: '300x300s')
    end
  end

  def test_avatar_with_supported_format
    assert @tester.image(size: '300x300', format: 'jpg').match(%r{https://placehold\.it/(.+)(jpg?)})
  end

  def test_avatar_with_incorrect_format
    assert_raise ArgumentError do
      @tester.image(size: '300x300', format: 'wrong_format')
    end
  end

  def test_avatar_background_with_correct_six_char_hex
    assert @tester.image(size: '300x300', format: 'jpg', background_color: 'ffffff').match(%r{https://placehold\.it/(.+)(jpg?)/ffffff})
  end

  def test_avatar_background_with_correct_three_char_hex
    assert @tester.image(size: '300x300', format: 'jpg', background_color: 'fff').match(%r{https://placehold\.it/(.+)(jpg?)/fff})
  end

  def test_avatar_background_with_random_color
    assert @tester.image(size: '300x300', format: 'jpg', background_color: :random).match(%r{https://placehold\.it/(.+)(jpg?)/[a-f0-9]{6}})
  end

  def test_avatar_background_with_wrong_six_char_hex
    assert_raise ArgumentError do
      @tester.image(size: '300x300', format: 'jpg', background_color: 'fffffz')
    end
  end

  def test_avatar_background_with_wrong_hex
    assert_raise ArgumentError do
      @tester.image(size: '300x300', format: 'jpg', background_color: 'ffff4')
    end
  end

  def test_avatar_background_with_wrong_three_char_hex
    assert_raise ArgumentError do
      @tester.image(size: '300x300', format: 'jpg', background_color: 'ffz')
    end
  end

  def test_avatar_font_color_with_correct_six_char_hex
    assert @tester.image(size: '300x300', format: 'jpg', background_color: 'ffffff', text_color: '000000').match(%r{https://placehold\.it/(.+)(jpg?)/ffffff/000000})
  end

  def test_avatar_font_color_with_correct_three_char_hex
    assert @tester.image(size: '300x300', format: 'jpg', background_color: 'fff', text_color: '000').match(%r{https://placehold\.it/(.+)(jpg?)/fff})
  end

  def test_avatar_font_color_with_random_color
    assert @tester.image(size: '300x300', format: 'jpg', background_color: 'fff', text_color: :random).match(%r{https://placehold\.it/(.+)(jpg?)/fff/[a-f0-9]{6}})
  end

  def test_avatar_font_color_with_wrong_six_char_hex
    assert_raise ArgumentError do
      @tester.image(size: '300x300', format: 'jpg', background_color: 'ffffff', text_color: '900F0z')
    end
  end

  def test_avatar_font_color_with_wrong_hex
    assert_raise ArgumentError do
      @tester.image(size: '300x300', format: 'jpg', background_color: 'ffffff', text_color: 'x9')
    end
  end

  def test_avatar_font_color_with_wrong_three_char_hex
    assert_raise ArgumentError do
      @tester.image(size: '300x300', format: 'jpg', background_color: 'ffffff', text_color: '00p')
    end
  end

  def test_text_not_present
    assert @tester.image(size: '300x300', format: 'jpg', background_color: 'fff', text_color: '000').match(%r{https://placehold\.it/[^\\?]+$})
  end

  def test_text_present
    assert @tester.image(size: '300x300', format: 'jpg', background_color: 'fff', text_color: '000', text: 'hello').match(%r{https://placehold\.it/(.+)\?text=hello})
  end
end
