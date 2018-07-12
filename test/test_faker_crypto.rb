# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerCrypto < Test::Unit::TestCase
  def setup
    @tester = Faker::Crypto
  end

  def test_md5
    assert @tester.md5.match(/\A[a-z0-9]{32}\z/)
  end

  def test_sha1
    assert @tester.sha1.match(/\A[a-z0-9]{40}\z/)
  end

  def test_sha256
    assert @tester.sha256.match(/\A[a-z0-9]{64}\z/)
  end
end
