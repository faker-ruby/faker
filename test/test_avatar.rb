require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerAvatar < Test::Unit::TestCase
  def setup
    @tester = Faker::Avatar
  end

  def test_avatar
    assert @tester.image.match(/http:\/\/robohash\.org\/(.+)/)[1] != nil
  end

  def test_avatar_with_param
    assert @tester.image('faker').match(/http:\/\/robohash\.org\/(.+)/)[1] == 'faker'
  end
end