# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerX < Test::Unit::TestCase
  def setup
    @tester = Faker::X
  end

  def test_user
    user = @tester.user

    assert_kind_of Hash, user
    assert_kind_of Array, user[:data]
    assert_kind_of Hash, user[:includes]
    assert_kind_of Array, user[:includes][:users]
  end

  def test_tweet
    tweet = @tester.tweet

    assert_kind_of Hash, tweet
    assert_kind_of Array, tweet[:data]
    assert_nil tweet[:includes]
  end

  def test_tweet_with_include_media
    tweet = @tester.tweet(include_media: true)

    assert_kind_of Hash, tweet
    assert_kind_of Array, tweet[:data]
    assert_kind_of Array, tweet[:includes][:media]
  end

  def test_tweet_with_include_user
    tweet = @tester.tweet(include_user: true)

    assert_kind_of Hash, tweet
    assert_kind_of Array, tweet[:data]
    assert_kind_of Array, tweet[:includes][:users]
  end

  def test_tweet_with_include_user_and_include_media
    tweet = @tester.tweet(include_user: true, include_media: true)

    assert_kind_of Hash, tweet
    assert_kind_of Array, tweet[:data]
    assert_kind_of Array, tweet[:includes][:users]
    assert_kind_of Array, tweet[:includes][:media]
  end

  def test_screen_name
    assert_kind_of String, @tester.screen_name
  end
end
