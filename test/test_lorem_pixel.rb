require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestLoremPixel < Test::Unit::TestCase
  def setup
    @tester = Faker::LoremPixel
  end

  def test_placeholdit
    assert @tester.image.match(/http:\/\/lorempixel\.com\/(\d+\/\d+)/)[1] != nil
  end

  def test_image_with_custom_size
    assert @tester.image('3x3').match(/http:\/\/lorempixel\.com\/(\d+\/\d+)/)[1] == '3/3'
  end

  def test_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.image('300x300s')
    end
  end

  def test_image_gray
    assert @tester.image('300x300', true).match(/http:\/\/lorempixel\.com\/g\/\d+\/\d+/)
  end

  def test_image_with_supported_category
    assert @tester.image('300x300', false, 'animals').match(/http:\/\/lorempixel\.com\/\d+\/\d+\/(.*)/)[1] == 'animals'
  end

  def test_image_with_incorrect_category
    assert_raise ArgumentError do
      @tester.image('300x300', false, 'wrong_category')
    end
  end

  def test_image_with_supported_category_and_correct_number
    assert @tester.image('300x300', false, 'animals', 3).match(/http:\/\/lorempixel\.com\/\d+\/\d+\/.+\/(\d+)/)[1] == '3'
  end

  def test_image_with_supported_category_and_incorrect_number
    assert_raise ArgumentError do
      @tester.image('300x300', false, 'animals', 11)
    end
  end

  def test_image_with_correct_number_and_without_category
    assert_raise ArgumentError do
      @tester.image('300x300', false, 'wrong_category', 3)
    end
  end

  def test_image_with_text_correct_number_and_supported_category
    assert @tester.image('300x300', false, 'animals', 3, 'Dummy-text').match(/http:\/\/lorempixel\.com\/\d+\/\d+\/.+\/3\/(.+)/)[1] == 'Dummy-text'
  end

  def test_image_with_text_supported_category_and_text_without_number
    assert @tester.image('300x300', false, 'animals', nil, 'Dummy-text').match(/http:\/\/lorempixel\.com\/\d+\/\d+\/.+\/(.+)/)[1] == 'Dummy-text'
  end

  def test_image_with_text_without_number_and_category
    assert_raise ArgumentError do
      @tester.image('300x300', false, nil, nil, 'Dummy-text')
    end
  end

end
