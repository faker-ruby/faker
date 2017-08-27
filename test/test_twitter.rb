require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerTwitter < Test::Unit::TestCase
  def setup
    @tester = Faker::Twitter
  end

  def test_user
    user = @tester.user
    assert user.is_a?(Hash)
    assert user.keys.count == 41
    assert user[:status].is_a?(Hash)
    assert_nil user[:status][:user]
  end

  def test_user_with_email
    user = @tester.user(include_email: true)
    assert user.is_a?(Hash)
    assert user.keys.count == 42
    assert user[:email].is_a?(String)
  end

  def test_user_without_status
    user = @tester.user(include_status: false)
    assert user.is_a?(Hash)
    assert user.keys.count == 40
    assert_nil user[:status]
  end

  def test_status
    status = @tester.status
    assert status.is_a?(Hash)
    assert status.keys.count == 25
    assert status[:entities].is_a?(Hash)
    assert status[:user].is_a?(Hash)
    assert_nil status[:user][:status]
  end

  def test_status_without_user
    status = @tester.status(include_user: false)
    assert status.is_a?(Hash)
    assert status.keys.count == 24
    assert_nil status[:user]
  end

  def test_status_with_photo
    status = @tester.status(include_photo: true)
    assert status.is_a?(Hash)
    assert status.keys.count == 25
    assert status[:entities].is_a?(Hash)
    assert status[:entities][:media].count == 1
    assert status[:entities][:media].first.keys.count == 10
  end
end
