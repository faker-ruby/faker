# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCrypto < Test::Unit::TestCase
  def setup
    @tester = Faker::Crypto
  end

  def test_md5
    assert_match(/\A[a-z0-9]{32}\z/, @tester.md5)
  end

  def test_sha1
    assert_match(/\A[a-z0-9]{40}\z/, @tester.sha1)
  end

  def test_sha256
    assert_match(/\A[a-z0-9]{64}\z/, @tester.sha256)
  end
end
