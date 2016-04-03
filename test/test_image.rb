require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerImage < Test::Unit::TestCase
  def setup
    @tester = Faker::Image
  end

  def test_image_with_size
    assert @tester.image(nil, '150x320').match(/http:\/\/loremflickr\.com\/(\d+)\/(\d+)/)[1] == '150'
    assert @tester.image(nil, '150x320').match(/http:\/\/loremflickr\.com\/(\d+)\/(\d+)/)[2] == '320'
  end

  def test_image_with_size_and_subject
    assert @tester.image('faker', '150x320').match(/http:\/\/loremflickr\.com\/(\d+)\/(\d+)\/(.+)/)[1] == '150'
    assert @tester.image('faker', '150x320').match(/http:\/\/loremflickr\.com\/(\d+)\/(\d+)\/(.+)/)[2] == '320'
    assert @tester.image('faker', '150x320').match(/http:\/\/loremflickr\.com\/(\d+)\/(\d+)\/(.+)/)[3] == 'faker'
  end

  def test_image_with_incorrect_size
    assert_raise ArgumentError do
      @tester.image(nil, '150x320z')
    end
  end

  def test_image_with_no_size
    assert_raise ArgumentError do
      @tester.image(nil, nil)
    end
  end
end
