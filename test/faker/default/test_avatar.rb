# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAvatar < Test::Unit::TestCase
  def setup
    @tester = Faker::Avatar
  end

  def test_avatar
    refute_nil @tester.image.match(%r{https://robohash\.org/(.+)\.png})[1]
  end

  def test_avatar_with_param
    assert_equal('faker', @tester.image(slug: 'faker').match(%r{https://robohash\.org/(.+)\.png})[1])
  end

  def test_avatar_with_correct_size
    assert_equal('150x320', @tester.image(slug: 'faker', size: '150x320').match(%r{https://robohash\.org/faker\.png\?size=(.+)&.*})[1])
  end

  def test_avatar_with_incorrect_size
    assert_raise ArgumentError do
      @tester.image(slug: nil, size: '150x320z')
    end
  end

  def test_avatar_with_supported_format
    assert_match %r{https://robohash\.org/faker\.jpg}, @tester.image(slug: 'faker', size: '300x300', format: 'jpg')
  end

  def test_avatar_with_incorrect_format
    assert_raise ArgumentError do
      @tester.image(slug: nil, size: '300x300', format: 'wrong_format')
    end
  end

  def test_avatar_with_set
    assert_match %r{https://robohash\.org/faker\.jpg.*set=set2}, @tester.image(slug: 'faker', size: '300x300', format: 'jpg', set: 'set2')
  end

  def test_avatar_with_bgset
    assert_match %r{https://robohash\.org/faker\.jpg.*bgset=bg1}, @tester.image(slug: 'faker', size: '300x300', format: 'jpg', set: 'set1', bgset: 'bg1')
  end
end
