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
    assert @tester.email(name: 'jane doe', separators: '+').match(/.+\+.+@.+\.\w+/)
  end

  def test_email_with_domain_option_given
    assert @tester.email(name: 'jane doe', domain: 'customdomain').match(/.+@customdomain\.\w+/)
  end

  def test_email_with_domain_option_given_with_domain_suffix
    assert @tester.email(name: 'jane doe', domain: 'customdomain.customdomainsuffix').match(/.+@customdomain\.customdomainsuffix/)
  end

  def test_free_email
    assert @tester.free_email.match(/.+@(gmail|hotmail|yahoo)\.com/)
  end

  def test_safe_email
    assert @tester.safe_email.match(/.+@example.(com|net|org)/)
  end

  def test_username
    assert @tester.username(specifier: 0..3).match(/[a-z]+((_|\.)[a-z]+)?/)
    assert @tester.username.match(/[a-z]+((_|\.)[a-z]+)?/)
  end

  def test_user_name_alias
    assert_equal @tester.method(:username), @tester.method(:user_name)
  end

  def test_username_with_string_arg
    assert @tester.username(specifier: 'bo peep').match(/(bo(_|\.)peep|peep(_|\.)bo)/)
  end

  def test_username_with_string_arg_determinism
    deterministically_verify -> { @tester.username(specifier: 'bo peep') }, depth: 4 do |subject|
      assert subject.match(/(bo(_|\.)peep|peep(_|\.)bo)/)
    end
  end

  def test_username_with_integer_arg
    (1..32).each do |min_length|
      assert @tester.username(specifier: min_length).length >= min_length
    end
  end

  def test_username_with_utf_8_arg
    # RUBY_VERSION < '2.4.0' is not able to downcase or upcase non-ascii strings
    if RUBY_VERSION < '2.4.0'
      assert @tester.username(specifier: 'Łucja').match('Łucja')
    else
      assert @tester.username(specifier: 'Łucja').match('łucja')
    end
  end

  def test_username_with_very_large_integer_arg
    exception = assert_raises(ArgumentError) { @tester.username(specifier: 10_000_000) }
    assert_equal('Given argument is too large', exception.message)
  end

  def test_username_with_closed_range_arg
    (1..32).each do |min_length|
      (min_length..32).each do |max_length|
        l = @tester.username(specifier: (min_length..max_length)).length
        assert l >= min_length
        assert l <= max_length
      end
    end
  end

  def test_username_with_open_range_arg
    (1..32).each do |min_length|
      (min_length + 1..33).each do |max_length|
        l = @tester.username(specifier: (min_length...max_length)).length
        assert l >= min_length
        assert l <= max_length - 1
      end
    end
  end

  def test_username_with_range_and_separators
    (1..32).each do |min_length|
      (min_length + 1..33).each do |max_length|
        u = @tester.username(specifier: (min_length...max_length), separators: %w[=])
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
      assert @tester.password(min_length: min_length, mix_case: false).length >= min_length
    end
  end

  def test_password_max_with_integer_arg
    (1..32).each do |min_length|
      max_length = min_length + 4
      assert @tester.password(min_length: min_length, max_length: max_length, mix_case: false).length <= max_length
    end
  end

  def test_password_could_achieve_max_length
    passwords = []
    64.times do
      passwords << @tester.password(min_length: 14, max_length: 16)
    end
    assert passwords.select { |item| item.length == 16 }.size >= 1
  end

  def test_password_with_mixed_case
    password = @tester.password
    upcase_count = 0
    downcase_count = 0
    password.chars.each do |char|
      if char =~ /[[:alpha:]]/
        char.capitalize == char ? upcase_count += 1 : downcase_count += 1
      end
    end
    assert upcase_count >= 1
    assert downcase_count >= 1
  end

  def test_password_without_mixed_case
    assert @tester.password(min_length: 8, max_length: 12, mix_case: false).match(/[^A-Z]+/)
  end

  def test_password_with_special_chars
    assert @tester.password(min_length: 8, max_length: 12, mix_case: true, special_characters: true).match(/[!@#\$%\^&\*]+/)
  end

  def test_password_without_special_chars
    assert @tester.password(min_length: 8, max_length: 12, mix_case: true).match(/[^!@#\$%\^&\*]+/)
  end

  def test_domain_name_without_subdomain
    assert @tester.domain_name.match(/\w+\.\w+/)
  end

  def test_domain_name_with_subdomain
    assert @tester.domain_name(subdomain: true).match(/\w+\.\w+\.\w+/)
  end

  def test_domain_name_with_subdomain_and_with_domain_option_given
    assert @tester.domain_name(subdomain: true, domain: 'customdomain').match(/customdomain\.\w+/)
  end

  def test_domain_name_with_subdomain_and_with_domain_option_given_with_domain_suffix
    assert @tester.domain_name(subdomain: true, domain: 'customdomain.customdomainsuffix').match(/customdomain\.customdomainsuffix/)
  end

  def test_domain_word
    assert @tester.domain_word.match(/^\w+$/)
  end

  def test_domain_suffix
    assert @tester.domain_suffix.match(/^\w+(\.\w+)?/)
  end

  def test_ip_v4_address
    100.times do
      assert_nothing_raised IPAddr::Error, IPAddr::AddressFamilyError, IPAddr::InvalidAddressError, StandardError do
        address = IPAddr.new(@tester.ip_v4_address, Socket::AF_INET)
        raise StandardError, "Invalid IP V4 #{address}" unless address.ipv4?
      end
    end
  end

  def test_private_ip_v4_address
    1000.times do
      address = @tester.private_ip_v4_address
      if RUBY_VERSION >= '2.5.0'
        assert IPAddr.new(address, Socket::AF_INET).private?
      else
        assert Faker::Internet.send(:private_ipv4_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
      end
    end
  end

  def test_public_ip_v4_address
    1000.times do
      address = @tester.public_ip_v4_address
      if RUBY_VERSION >= '2.5.0'
        ip_address = IPAddr.new(address, Socket::AF_INET) # may throw in case of invalid address, but the  case is handled above
        puts "#{ip_address} link_local ? #{ip_address.link_local?}"
        puts "#{ip_address} private ? #{ip_address.private?}"
        puts "#{ip_address} loopback? #{ip_address.loopback?}"
        assert !(ip_address.private? || ip_address.loopback? || ip_address.link_local?)
      else
        assert Faker::Internet.send(:public_ipv4_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
      end
    end
  end

  def test_link_local_ip_v4_address
    1000.times do
      address = @tester.link_local_ip_v4_address
      if RUBY_VERSION >= '2.5.0'
        assert IPAddr.new(address, Socket::AF_INET).link_local?
      else
        assert Faker::Internet.send(:link_local_ipv4_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
      end
    end
  end

  def test_loopback_ip_v4_address
    1000.times do
      address = @tester.loopback_ip_v4_address
      if RUBY_VERSION >= '2.5.0'
        assert IPAddr.new(address, Socket::AF_INET).loopback?
      else
        assert Faker::Internet.send(:loopback_ipv4_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
      end
    end
  end

  def test_ip_v4_cidr
    assert @tester.ip_v4_cidr.match(%r(\/\d{1,2}$))

    1000.times do
      assert((1..32).cover?(@tester.ip_v4_cidr.split('/').last.to_i))
    end
  end

  def test_public_ip_v4_cidr
    address = @tester.public_ip_v4_cidr
    assert Faker::Internet.send(:public_ipv4_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
  end

  def test_private_ip_v4_cidr
    address = @tester.private_ip_v4_cidr
    assert Faker::Internet.send(:private_ipv4_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
  end

  def test_loopback_ip_v4_cidr
    address = @tester.loopback_ip_v4_cidr
    assert Faker::Internet.send(:loopback_ipv4_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
  end

  def test_link_local_ip_v4_cidr
    address = @tester.link_local_ip_v4_cidr
    assert Faker::Internet.send(:link_local_ipv4_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
  end

  def test_mac_address
    assert_equal 5, @tester.mac_address.count(':')
    assert_equal 5, @tester.mac_address(prefix: '').count(':')

    100.times do
      assert @tester.mac_address.split(':').map { |d| d.to_i(16) }.max <= 255
    end

    assert @tester.mac_address(prefix: 'fa:fa:fa').start_with?('fa:fa:fa')
    assert @tester.mac_address(prefix: '01:02').start_with?('01:02')
  end

  def test_ip_v6_address
    100.times do
      assert_nothing_raised IPAddr::Error, IPAddr::AddressFamilyError, IPAddr::InvalidAddressError, StandardError do
        address = IPAddr.new(@tester.ip_v6_address, ::Socket::AF_INET6)
        raise StandardError, "Invalid IP V6 #{address}" unless address.ipv6?
      end
    end
  end

  def test_link_local_ip_v6_address
    1000.times do
      address = @tester.link_local_ip_v6_address
      if RUBY_VERSION >= '2.5.0'
        assert IPAddr.new(address, Socket::AF_INET6).link_local?
      else
        assert Faker::Internet.send(:link_local_ipv6_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
      end
    end
  end

  def test_loopback_ip_v6_address
    1000.times do
      address = @tester.loopback_ip_v6_address
      if RUBY_VERSION >= '2.5.0'
        assert IPAddr.new(address, Socket::AF_INET6).loopback?
      else
        assert Faker::Internet.send(:loopback_ipv6_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
      end
    end
  end

  def test_private_ip_v6_address
    1000.times do
      address = @tester.private_ip_v6_address
      if RUBY_VERSION >= '2.5.0'
        assert IPAddr.new(address, Socket::AF_INET6).private?
      else
        assert Faker::Internet.send(:private_ipv6_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
      end
    end
  end

  def test_public_ip_v6_address
    1000.times do
      address = @tester.public_ip_v6_address
      if RUBY_VERSION >= '2.5.0'
        ip_address = IPAddr.new(address, Socket::AF_INET6) # may throw in case of invalid address, but the  case is handled above
        assert !(ip_address.private? || ip_address.loopback? || ip_address.link_local?)
      else
        assert Faker::Internet.send(:public_ipv6_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
      end
    end
  end

  def test_ip_v6_cidr
    assert @tester.ip_v6_cidr.match(%r{\/\d{1,3}$})

    1000.times do
      assert((1..128).cover?(@tester.ip_v6_cidr.split('/').last.to_i))
    end
  end

  def test_public_ip_v6_cidr
    address = @tester.public_ip_v6_cidr
    assert Faker::Internet.send(:public_ipv6_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
  end

  def test_private_ip_v6_cidr
    address = @tester.private_ip_v6_cidr
    assert Faker::Internet.send(:private_ipv6_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
  end

  def test_loopback_ip_v6_cidr
    address = @tester.loopback_ip_v6_cidr
    assert Faker::Internet.send(:loopback_ipv6_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
  end

  def test_link_local_ip_v6_cidr
    address = @tester.link_local_ip_v6_cidr
    assert Faker::Internet.send(:link_local_ipv6_subnets).detect(false) { |i| IPAddr.new(i).include?(address) }
  end

  def test_slug
    assert @tester.slug.match(/^[a-z]+(_|\-)[a-z]+$/)
  end

  def test_slug_with_content_arg
    assert @tester.slug(words: 'Foo bAr baZ').match(/^foo(_|\.|\-)bar(_|\.|\-)baz$/)
  end

  def test_slug_with_unwanted_content_arg
    assert @tester.slug(words: 'Foo.. bAr., baZ,,').match(/^foo(_|\.|\-)bar(_|\.|\-)baz$/)
  end

  def test_slug_with_glue_arg
    assert @tester.slug(words: nil, glue: '+').match(/^[a-z]+\+[a-z]+$/)
  end

  def test_url
    assert @tester.url(host: 'domain.com', path: '/username', scheme: 'https').match(%r{^https:\/\/domain\.com\/username$})
  end

  def test_device_token
    assert_equal 64, @tester.device_token.size
  end

  def test_user_agent_with_no_argument
    assert @tester.user_agent.match(/Mozilla|Opera/)
  end

  def test_user_agent_with_valid_argument
    assert @tester.user_agent(vendor: :opera).match(/Opera/)
    assert @tester.user_agent(vendor: 'opera').match(/Opera/)
  end

  def test_user_agent_with_invalid_argument
    assert @tester.user_agent(vendor: :ie).match(/Mozilla|Opera/)
    assert @tester.user_agent(vendor: nil).match(/Mozilla|Opera/)
    assert @tester.user_agent(vendor: 1).match(/Mozilla|Opera/)
  end

  def test_uuid
    uuid = @tester.uuid
    assert_equal(36, uuid.size)
    assert_match(/\A\h{8}-\h{4}-4\h{3}-\h{4}-\h{12}\z/, uuid)
  end
end
