# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCrypto < Test::Unit::TestCase
  def setup
    @tester = Faker::Crypto
  end

  def test_md5
    assert_match @tester.md5, /\A[a-z0-9]{32}\z/
  end

  def test_sha1
    assert_match @tester.sha1, /\A[a-z0-9]{40}\z/
  end

  def test_sha256
    assert_match @tester.sha256, /\A[a-z0-9]{64}\z/
  end
end
