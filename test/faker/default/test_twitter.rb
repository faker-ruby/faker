# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTwitter < Test::Unit::TestCase
  def setup
    @tester = Faker::Twitter
  end

  def test_user
    user = @tester.user

    assert user.is_a?(Hash)
    assert_equal(41, user.keys.count)
    assert user[:status].is_a?(Hash)
    assert_nil user[:status][:user]
  end

  def test_user_with_email
    user = @tester.user(include_email: true)

    assert user.is_a?(Hash)
    assert_equal(42, user.keys.count)
    assert user[:email].is_a?(String)
  end

  def test_user_without_status
    user = @tester.user(include_status: false)

    assert user.is_a?(Hash)
    assert_equal(40, user.keys.count)
    assert_nil user[:status]
  end

  def test_status
    status = @tester.status

    assert status.is_a?(Hash)
    assert_equal(25, status.keys.count)
    assert status[:entities].is_a?(Hash)
    assert status[:user].is_a?(Hash)
    assert_nil status[:user][:status]
  end

  def test_status_without_user
    status = @tester.status(include_user: false)

    assert status.is_a?(Hash)
    assert_equal(24, status.keys.count)
    assert_nil status[:user]
  end

  def test_status_with_photo
    status = @tester.status(include_photo: true)

    assert status.is_a?(Hash)
    assert_equal(25, status.keys.count)
    assert status[:entities].is_a?(Hash)
    assert_equal(1, status[:entities][:media].count)
    assert_equal(10, status[:entities][:media].first.keys.count)
  end
end
