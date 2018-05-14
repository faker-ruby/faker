require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerAvatar < Test::Unit::TestCase
  def setup
    @tester = Faker::Avatar
  end

  def test_avatar
    assert @tester.image.match(/https:\/\/robohash\.org\/(.+)\.png/)[1] != nil
  end

  def test_avatar_with_param
    assert @tester.image('faker').match(/https:\/\/robohash\.org\/(.+)\.png/)[1] == 'faker'
  end

  def test_avatar_with_correct_size
    assert @tester.image('faker', '150x320').match(/https:\/\/robohash\.org\/faker\.png\?size=(.+)&.*/)[1] == '150x320'
  end

  def test_avatar_with_incorrect_size
    assert_raise ArgumentError do
      @tester.image(nil, '150x320z')
    end
  end

  def test_avatar_with_supported_format
    assert @tester.image('faker', '300x300', 'jpg').match(/https:\/\/robohash\.org\/faker\.jpg/)
  end

  def test_avatar_with_incorrect_format
    assert_raise ArgumentError do
      @tester.image(nil, '300x300', 'wrong_format')
    end
  end

  def test_avatar_with_set
    assert @tester.image('faker', '300x300', 'jpg', 'set2').match(/https:\/\/robohash\.org\/faker\.jpg.*set=set2/)
  end

  def test_avatar_with_bgset
    assert @tester.image('faker', '300x300', 'jpg', 'set1', 'bg1').match(/https:\/\/robohash\.org\/faker\.jpg.*bgset=bg1/)
  end
end
