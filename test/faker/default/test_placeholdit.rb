# frozen_string_literal: true

require_relative '../../test_helper'

class TestPlaceholdit < Test::Unit::TestCase
  def setup
    @tester = Faker::Placeholdit
  end

  def test_placeholdit
    refute_nil @tester.image.match(%r{https://placehold\.co/(.+)(png?)})[1]
  end

  def test_avatar_with_custom_size
    assert_equal('3x3', @tester.image(size: '3x3').match(%r{https://placehold\.co/+(\d+x\d+)})[1])
  end

  def test_avatar_with_incorrect_size
    assert_raise ArgumentError do
      @tester.image(size: '300x300s')
    end
  end

  def test_avatar_with_supported_format
    assert_match %r{https://placehold\.co/(.+)(jpg?)}, @tester.image(size: '300x300', format: 'jpg')
  end

  def test_avatar_with_incorrect_format
    assert_raise ArgumentError do
      @tester.image(size: '300x300', format: 'wrong_format')
    end
  end

  def test_avatar_uses_000_as_text_when_only_specifying_background
    assert_match %r{https://placehold\.co/(.+)/ffffff/000}, @tester.image(size: '300x300', format: 'jpg', background_color: 'ffffff')
  end

  def test_avatar_background_with_correct_six_char_hex
    assert_match %r{https://placehold\.co/(.+)/ffffff}, @tester.image(size: '300x300', format: 'jpg', background_color: 'ffffff')
  end

  def test_avatar_background_with_correct_three_char_hex
    assert_match %r{https://placehold\.co/(.+)/fff}, @tester.image(size: '300x300', format: 'jpg', background_color: 'fff')
  end

  def test_avatar_background_with_random_color
    assert_match %r{https://placehold\.co/(.+)/[a-f0-9]{6}/000}, @tester.image(size: '300x300', format: 'jpg', background_color: :random)
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

  def test_avatar_uses_fff_as_background_when_only_specifying_font_color
    assert_match %r{https://placehold\.co/(.+)/fff/000000}, @tester.image(size: '300x300', format: 'jpg', text_color: '000000')
  end

  def test_avatar_font_color_with_correct_six_char_hex
    assert_match %r{https://placehold\.co/(.+)/ffffff/000000}, @tester.image(size: '300x300', format: 'jpg', background_color: 'ffffff', text_color: '000000')
  end

  def test_avatar_font_color_with_correct_three_char_hex
    assert_match %r{https://placehold\.co/(.+)/fff}, @tester.image(size: '300x300', format: 'jpg', background_color: 'fff', text_color: '000')
  end

  def test_avatar_font_color_with_random_color
    assert_match %r{https://placehold\.co/(.+)/fff/[a-f0-9]{6}}, @tester.image(size: '300x300', format: 'jpg', background_color: 'fff', text_color: :random)
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
    assert_match %r{https://placehold\.co/[^\\?]+$}, @tester.image(size: '300x300', format: 'jpg', background_color: 'fff', text_color: '000')
  end

  def test_text_present
    assert_match %r{https://placehold\.co/(.+)\?text=hello}, @tester.image(size: '300x300', format: 'jpg', background_color: 'fff', text_color: '000', text: 'hello')
  end
end
