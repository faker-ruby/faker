require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerInternetForJa < Test::Unit::TestCase
  def setup
    @tester = Faker::Internet
    Faker::Config.locale = 'ja'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_email
    assert @tester.email.match(/.+@.+\.\w+/)
  end

  def test_free_email
    assert @tester.free_email.match(/.+@(gmail|hotmail|yahoo)\.com/)
  end

  def test_safe_email
    assert @tester.safe_email.match(/.+@example.(com|net|org)/)
  end

  def test_user_name
    assert @tester.user_name.match(/[a-z]+((_|\.)[a-z]+)?/)
  end
end
