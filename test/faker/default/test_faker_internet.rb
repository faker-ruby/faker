# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerInternet < Test::Unit::TestCase
  def setup
    @tester = Faker::Internet
  end

  def test_email
    assert @tester.email.match(/.+@.+\.\w+/)
  end

  def test_email_with_separators
    assert @tester.email('jane doe', '+').match(/.+\+.+@.+\.\w+/)
  end

  def test_free_email
    assert @tester.free_email.match(/.+@(gmail|hotmail|yahoo)\.com/)
  end

  def test_safe_email
    assert @tester.safe_email.match(/.+@example.(com|net|org)/)
  end

  def test_username
    assert @tester.username(0..3).match(/[a-z]+((_|\.)[a-z]+)?/)
    assert @tester.username.match(/[a-z]+((_|\.)[a-z]+)?/)
  end

  def test_user_name_alias
    assert_equal @tester.method(:username), @tester.method(:user_name)
  end

  def test_username_with_string_arg
    assert @tester.username('bo peep').match(/(bo(_|\.)peep|peep(_|\.)bo)/)
  end

  def test_username_with_string_arg_determinism
    deterministically_verify -> { @tester.username('bo peep') }, depth: 4 do |subject|
      assert subject.match(/(bo(_|\.)peep|peep(_|\.)bo)/)
    end
  end

  def test_username_with_integer_arg
    (1..32).each do |min_length|
      assert @tester.username(min_length).length >= min_length
    end
  end

  def test_username_with_utf_8_arg
    # RUBY_VERSION < '2.4.0' is not able to downcase or upcase non-ascii strings
    if RUBY_VERSION < '2.4.0'
      assert @tester.username('Łucja').match('Łucja')
    else
      assert @tester.username('Łucja').match('łucja')
    end
  end

  def test_username_with_very_large_integer_arg
    exception = assert_raises(ArgumentError) { @tester.username(10_000_000) }
    assert_equal('Given argument is too large', exception.message)
  end

  def test_username_with_closed_range_arg
    (1..32).each do |min_length|
      (min_length..32).each do |max_length|
        l = @tester.username((min_length..max_length)).length
        assert l >= min_length
        assert l <= max_length
      end
    end
  end

  def test_username_with_open_range_arg
    (1..32).each do |min_length|
      (min_length + 1..33).each do |max_length|
        l = @tester.username((min_length...max_length)).length
        assert l >= min_length
        assert l <= max_length - 1
      end
    end
  end

  def test_username_with_range_and_separators
    (1..32).each do |min_length|
      (min_length + 1..33).each do |max_length|
        u = @tester.username((min_length...max_length), %w[=])
        assert u.length.between? min_length, max_length - 1
        assert u.match(/\A[a-z]+((=)?[a-z]*)*\z/)
      end
    end
  end

  def test_password
    assert @tester.password.match(/\w{3}/)
  end

  def test_password_with_integer_arg
    (1..32).each do |min_length|
      assert @tester.password(min_length).length >= min_length
    end
  end

  def test_password_max_with_integer_arg
    (1..32).each do |min_length|
      max_length = min_length + 4
      assert @tester.password(min_length, max_length).length <= max_length
    end
  end

  def test_password_could_achieve_max_length
    passwords = []
    64.times do
      passwords << @tester.password(14, 16)
    end
    assert passwords.select { |item| item.length == 16 }.size >= 1
  end

  def test_password_with_mixed_case
    assert @tester.password.match(/[A-Z]+/)
  end

  def test_password_without_mixed_case
    assert @tester.password(8, 12, false).match(/[^A-Z]+/)
  end

  def test_password_with_special_chars
    assert @tester.password(8, 12, true, true).match(/[!@#\$%\^&\*]+/)
  end

  def test_password_without_special_chars
    assert @tester.password(8, 12, true).match(/[^!@#\$%\^&\*]+/)
  end

  def test_domain_name_without_subdomain
    assert @tester.domain_name.match(/\w+\.\w+/)
  end

  def test_domain_name_with_subdomain
    assert @tester.domain_name(true).match(/\w+\.\w+\.\w+/)
  end

  def test_domain_word
    assert @tester.domain_word.match(/^\w+$/)
  end

  def test_domain_suffix
    assert @tester.domain_suffix.match(/^\w+(\.\w+)?/)
  end

  def test_ip_v4_address
    assert_equal 3, @tester.ip_v4_address.count('.')

    100.times do
      assert @tester.ip_v4_address.split('.').map(&:to_i).min >= 0
      assert @tester.ip_v4_address.split('.').map(&:to_i).max <= 255
    end
  end

  def test_private_ip_v4_address
    regexps = [
      /^10\./,                                       # 10.0.0.0    - 10.255.255.255
      /^100\.(6[4-9]|[7-9]\d|1[0-1]\d|12[0-7])\./,   # 100.64.0.0  - 100.127.255.255
      /^127\./,                                      # 127.0.0.0   - 127.255.255.255
      /^169\.254\./,                                 # 169.254.0.0 - 169.254.255.255
      /^172\.(1[6-9]|2\d|3[0-1])\./,                 # 172.16.0.0  - 172.31.255.255
      /^192\.0\.0\./,                                # 192.0.0.0   - 192.0.0.255
      /^192\.168\./,                                 # 192.168.0.0 - 192.168.255.255
      /^198\.(1[8-9])\./                             # 198.18.0.0  - 198.19.255.255
    ]
    expected = Regexp.new regexps.collect { |reg| "(#{reg})" }.join('|')

    1000.times do
      address = @tester.private_ip_v4_address
      assert_match expected, address
    end
  end

  def test_public_ip_v4_address
    private = [
      /^10\./,                                       # 10.0.0.0    - 10.255.255.255
      /^100\.(6[4-9]|[7-9]\d|1[0-1]\d|12[0-7])\./,   # 100.64.0.0  - 100.127.255.255
      /^127\./,                                      # 127.0.0.0   - 127.255.255.255
      /^169\.254\./,                                 # 169.254.0.0 - 169.254.255.255
      /^172\.(1[6-9]|2\d|3[0-1])\./,                 # 172.16.0.0  - 172.31.255.255
      /^192\.0\.0\./,                                # 192.0.0.0   - 192.0.0.255
      /^192\.168\./,                                 # 192.168.0.0 - 192.168.255.255
      /^198\.(1[8-9])\./                             # 198.18.0.0  - 198.19.255.255
    ]

    reserved = [
      /^0\./,                 # 0.0.0.0      - 0.255.255.255
      /^192\.0\.2\./,         # 192.0.2.0    - 192.0.2.255
      /^192\.88\.99\./,       # 192.88.99.0  - 192.88.99.255
      /^198\.51\.100\./,      # 198.51.100.0 - 198.51.100.255
      /^203\.0\.113\./,       # 203.0.113.0  - 203.0.113.255
      /^(22[4-9]|23\d)\./,    # 224.0.0.0    - 239.255.255.255
      /^(24\d|25[0-5])\./     # 240.0.0.0    - 255.255.255.254  and  255.255.255.255
    ]

    1000.times do
      address = @tester.public_ip_v4_address
      private.each { |reg| assert_not_match reg, address }
      reserved.each { |reg| assert_not_match reg, address }
    end
  end

  def test_ip_v4_cidr
    assert @tester.ip_v4_cidr.match(%r(\/\d{1,2}$))

    1000.times do
      assert((1..32).cover?(@tester.ip_v4_cidr.split('/').last.to_i))
    end
  end

  def test_mac_address
    assert_equal 5, @tester.mac_address.count(':')
    assert_equal 5, @tester.mac_address('').count(':')

    100.times do
      assert @tester.mac_address.split(':').map { |d| d.to_i(16) }.max <= 255
    end

    assert @tester.mac_address('fa:fa:fa').start_with?('fa:fa:fa')
    assert @tester.mac_address('01:02').start_with?('01:02')
  end

  def test_ip_v6_address
    assert_equal 7, @tester.ip_v6_address.count(':')

    100.times do
      assert @tester.ip_v6_address.split('.').map { |h| "0x#{h}".hex }.max <= 65_535
    end
  end

  def test_ip_v6_cidr
    assert @tester.ip_v6_cidr.match(%r{\/\d{1,3}$})

    1000.times do
      assert((1..128).cover?(@tester.ip_v6_cidr.split('/').last.to_i))
    end
  end

  def test_slug
    assert @tester.slug.match(/^[a-z]+(_|\-)[a-z]+$/)
  end

  def test_slug_with_content_arg
    assert @tester.slug('Foo bAr baZ').match(/^foo(_|\.|\-)bar(_|\.|\-)baz$/)
  end

  def test_slug_with_unwanted_content_arg
    assert @tester.slug('Foo.. bAr., baZ,,').match(/^foo(_|\.|\-)bar(_|\.|\-)baz$/)
  end

  def test_slug_with_glue_arg
    assert @tester.slug(nil, '+').match(/^[a-z]+\+[a-z]+$/)
  end

  def test_url
    assert @tester.url('domain.com', '/username', 'https').match(%r{^https:\/\/domain\.com\/username$})
  end

  def test_device_token
    assert_equal 64, @tester.device_token.size
  end

  def test_user_agent_with_no_argument
    assert @tester.user_agent.match(/Mozilla|Opera/)
  end

  def test_user_agent_with_valid_argument
    assert @tester.user_agent(:opera).match(/Opera/)
    assert @tester.user_agent('opera').match(/Opera/)
  end

  def test_user_agent_with_invalid_argument
    assert @tester.user_agent(:ie).match(/Mozilla|Opera/)
    assert @tester.user_agent(nil).match(/Mozilla|Opera/)
    assert @tester.user_agent(1).match(/Mozilla|Opera/)
  end
end
