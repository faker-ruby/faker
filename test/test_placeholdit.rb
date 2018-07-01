require_relative 'test_helper'

class TestPlaceholdit < Test::Unit::TestCase
  def setup
    @tester = Faker::Placeholdit
  end

  def test_placeholdit
    assert !@tester.image.match(%r{https:\/\/placehold\.it\/(.+)(png?)})[1].nil?
  end

  def test_avatar_with_custom_size
    assert @tester.image('3x3').match(%r{https:\/\/placehold\.it\/+(\d+x\d+)})[1] == '3x3'
  end

  def test_avatar_with_incorrect_size
    assert_raise ArgumentError do
      @tester.image('300x300s')
    end
  end

  def test_avatar_with_supported_format
    assert @tester.image('300x300', 'jpg').match(%r{https:\/\/placehold\.it\/(.+)(jpg?)})
  end

  def test_avatar_with_incorrect_format
    assert_raise ArgumentError do
      @tester.image('300x300', 'wrong_format')
    end
  end

  def test_avatar_background_with_correct_six_char_hex
    assert @tester.image('300x300', 'jpg', 'ffffff').match(%r{https:\/\/placehold\.it\/(.+)(jpg?)\/ffffff})
  end

  def test_avatar_background_with_correct_three_char_hex
    assert @tester.image('300x300', 'jpg', 'fff').match(%r{https:\/\/placehold\.it\/(.+)(jpg?)\/fff})
  end

  def test_avatar_background_with_random_color
    assert @tester.image('300x300', 'jpg', :random).match(%r{https:\/\/placehold\.it\/(.+)(jpg?)\/[a-f0-9]{6}})
  end

  def test_avatar_background_with_wrong_six_char_hex
    assert_raise ArgumentError do
      @tester.image('300x300', 'jpg', 'fffffz')
    end
  end

  def test_avatar_background_with_wrong_hex
    assert_raise ArgumentError do
      @tester.image('300x300', 'jpg', 'ffff4')
    end
  end

  def test_avatar_background_with_wrong_three_char_hex
    assert_raise ArgumentError do
      @tester.image('300x300', 'jpg', 'ffz')
    end
  end

  def test_avatar_font_color_with_correct_six_char_hex
    assert @tester.image('300x300', 'jpg', 'ffffff', '000000').match(%r{https:\/\/placehold\.it\/(.+)(jpg?)\/ffffff\/000000})
  end

  def test_avatar_font_color_with_correct_three_char_hex
    assert @tester.image('300x300', 'jpg', 'fff', '000').match(%r{https:\/\/placehold\.it\/(.+)(jpg?)\/fff})
  end

  def test_avatar_font_color_with_random_color
    assert @tester.image('300x300', 'jpg', 'fff', :random).match(%r{https:\/\/placehold\.it\/(.+)(jpg?)\/fff\/[a-f0-9]{6}})
  end

  def test_avatar_font_color_with_wrong_six_char_hex
    assert_raise ArgumentError do
      @tester.image('300x300', 'jpg', 'ffffff', '900F0z')
    end
  end

  def test_avatar_font_color_with_wrong_hex
    assert_raise ArgumentError do
      @tester.image('300x300', 'jpg', 'ffffff', 'x9')
    end
  end

  def test_avatar_font_color_with_wrong_three_char_hex
    assert_raise ArgumentError do
      @tester.image('300x300', 'jpg', 'ffffff', '00p')
    end
  end

  def test_text_not_present
    assert @tester.image('300x300', 'jpg', 'fff', '000').match(%r{https:\/\/placehold\.it\/[^\\?]+$})
  end

  def test_text_present
    assert @tester.image('300x300', 'jpg', 'fff', '000', 'hello').match(%r{https:\/\/placehold\.it\/(.+)\?text=hello})
  end
end
