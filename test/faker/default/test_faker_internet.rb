# frozen_string_literal: true

require_relative '../../test_helper'
require 'uri'

class TestFakerInternet < Test::Unit::TestCase
  def setup
    @tester = Faker::Internet
    @default_locale = Faker::Config.locale
  end

  def teardown
    Faker::Config.locale = @default_locale
  end

  def test_email_with_no_arguments
    deterministically_verify -> { @tester.email } do |result|
      name, domain = result.split('@')

      domain_name, domain_suffix = domain.split('.')

      assert name.is_a? String
      assert domain_name.is_a? String
      assert_includes(%w[example test], domain_suffix)
    end
  end

  def test_email_name_with_non_permitted_characters
    deterministically_verify -> { @tester.email(name: 'martín') } do |result|
      name, domain = result.split('@')
      domain_name, domain_suffix = domain.split('.')

      assert_equal('mart#n', name)
      assert domain_name.is_a? String
      assert_includes(%w[example test], domain_suffix)
    end
  end

  def test_email_with_separators
    deterministically_verify -> { @tester.email(name: 'jane doe', separators: '+') } do |result|
      name, domain = result.split('@')
      domain_name, domain_suffix = domain.split('.')

      assert_match(/(jane\+doe|doe\+jane)/, name)
      assert domain_name.is_a? String
      assert_includes(%w[example test], domain_suffix)
    end
  end

  def test_email_with_domain_name_option_given
    result = @tester.email(domain: 'customdomain')

    name, domain = result.split('@')
    domain_name, domain_suffix = domain.split('.')

    assert name.is_a? String
    assert_equal('customdomain', domain_name)
    assert_includes(%w[example test], domain_suffix)
  end

  def test_email_with_full_domain_option_given
    deterministically_verify -> { @tester.email(domain: 'customdomain.org') } do |result|
      name, domain = result.split('@')

      assert name.is_a? String
      assert_equal('customdomain.org', domain)
    end
  end

  def test_email_with_name_seperators_domain
    deterministically_verify -> { @tester.email(name: 'faker ruby', separators: '-', domain: 'test') } do |result|
      name, domain = result.split('@')
      domain_name, domain_suffix = domain.split('.')

      assert_match(/(ruby-faker|faker-ruby)/, name)
      assert_equal('test', domain_name)
      assert_includes(%w[example test], domain_suffix)
    end
  end

  def test_free_email
    Gem::Deprecate.skip_during do
      assert_match(/.+@(gmail|hotmail|yahoo)\.com/, @tester.free_email)
    end
  end

  def test_free_email_with_non_permitted_characters
    Gem::Deprecate.skip_during do
      assert_match(/mart#n@.+\.\w+/, @tester.free_email(name: 'martín'))
    end
  end

  def test_safe_email
    Gem::Deprecate.skip_during do
      assert_match(/.+@example.(com|net|org)/, @tester.safe_email)
    end
  end

  def test_safe_email_with_non_permitted_characters
    Gem::Deprecate.skip_during do
      assert_match(/mart#n@.+\.\w+/, @tester.safe_email(name: 'martín'))
    end
  end

  def test_username
    assert_match(/[a-z]+((_|\.)[a-z]+)?/, @tester.username(specifier: 0..3))
    assert_match(/[a-z]+((_|\.)[a-z]+)?/, @tester.username)
  end

  def test_user_name_alias
    assert_equal @tester.method(:username), @tester.method(:user_name)
  end

  def test_username_with_string_arg
    assert_match(/(bo(_|\.)peep|peep(_|\.)bo)/, @tester.username(specifier: 'bo peep'))
  end

  def test_username_with_string_arg_determinism
    deterministically_verify -> { @tester.username(specifier: 'bo peep') }, depth: 4 do |username|
      assert_match(/(bo(_|\.)peep|peep(_|\.)bo)/, username)
    end
  end

  def test_username_with_integer_arg
    (1..32).each do |min_length|
      assert @tester.username(specifier: min_length).length >= min_length
    end
  end

  def test_username_with_utf_8_arg
    assert_match @tester.username(specifier: 'Łucja'), 'łucja'
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
        assert_match(/\A[a-z]+((=)?[a-z]*)*\z/, u)
      end
    end
  end

  def test_password_with_no_arguments
    password = @tester.password
    default_min_length = 8
    default_max_length = 16

    assert_match(/\w{3}/, password)
    assert_match(/[a-z]/, password)
    assert_match(/[A-Z]/, password)
    assert_match(/[0-9]/, password)
    assert_includes((default_min_length..default_max_length), password.length, 'Generated password length is incorrect')
  end

  def test_password_with_integer_arg
    (1..32).each do |min_length|
      max_length = min_length + 1

      assert_includes (min_length..max_length), @tester.password(min_length: min_length, max_length: max_length, mix_case: false).length
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

  def test_password_with_min_length_eq_1_without_mix_case
    password = @tester.password(min_length: 1, mix_case: false)

    assert_match(/\w+/, password)
  end

  def test_password_with_min_length_and_max_length
    min_length = 2
    max_length = 5
    password = @tester.password(min_length: min_length, max_length: max_length)

    assert_match(/\w+/, password)
    assert_includes (min_length..max_length), password.size, 'Password size is incorrect'
  end

  def test_password_with_same_min_max_length
    password = @tester.password(min_length: 5, max_length: 5)

    assert_match(/\w+/, password)
    assert_equal(5, password.length)
  end

  def test_password_with_max_length_less_than_min_length
    assert_raise 'min_length must be smaller than or equal to max_length' do
      @tester.password(min_length: 8, max_length: 4)
    end
  end

  def test_password_without_mixed_case
    assert_match(/[^A-Z]+/, @tester.password(min_length: 8, max_length: 12, mix_case: false))
  end

  def test_password_with_special_chars
    assert_match(/[!@#$%\^&*]+/, @tester.password(min_length: 8, max_length: 12, mix_case: true, special_characters: true))
  end

  def test_password_without_special_chars
    assert_match(/[^!@#$%\^&*]+/, @tester.password(min_length: 8, max_length: 12, mix_case: true))
  end

  def test_password_with_special_chars_and_mixed_case
    32.times do
      password = @tester.password(min_length: 4, max_length: 6, mix_case: true, special_characters: true)

      assert_match(/[!@#$%\^&*]+/, password)
      assert_match(/[A-z]+/, password)
    end
  end

  def test_deterministic_password_with_special_chars_and_mixed_case
    deterministically_verify -> { @tester.password(min_length: 4, max_length: 6, mix_case: true, special_characters: true) }, depth: 4 do |password|
      assert_match(/[!@#$%\^&*]+/, password)
      assert_match(/[A-z]+/, password)
    end
  end

  def test_password_with_special_chars_and_mixed_case_on_3chars_password
    16.times do
      password = @tester.password(min_length: 3, max_length: 6, mix_case: true, special_characters: true)

      assert_match(/[!@#$%\^&*]+/, password)
      assert_match(/[A-z]+/, password)
    end
  end

  def test_password_with_invalid_min_length_for_mix_case_and_special_characters
    assert_raise_message 'min_length should be at least 3 to enable mix_case, special_characters configuration' do
      @tester.password(min_length: 1, mix_case: true, special_characters: true)
    end
  end

  def test_password_with_invalid_min_max_length
    error = assert_raises(ArgumentError) do
      @tester.password(min_length: 0, max_length: 0, mix_case: false, special_characters: false)
    end

    assert_equal 'min_length and max_length must be greater than or equal to one', error.message
  end

  def test_password_with_invalid_min_length_for_special_characters_only
    error = assert_raises(ArgumentError) do
      @tester.password(min_length: 0, mix_case: false, special_characters: true)
    end

    assert_equal 'min_length and max_length must be greater than or equal to one', error.message
  end

  def test_password_with_invalid_min_length_for_mix_case_only
    error = assert_raises(ArgumentError) do
      @tester.password(min_length: 1, mix_case: true)
    end

    assert_equal 'min_length should be at least 2 to enable mix_case configuration', error.message
  end

  def test_password_with_compatible_min_length_and_requirements
    assert_nothing_raised do
      [false, true].each do |value|
        min_length = value ? 2 : 1
        @tester.password(min_length: min_length, mix_case: value, special_characters: !value)
      end
    end
  end

  def test_deterministic_password_with_compatible_min_length_and_requirements
    [false, true].each do |value|
      min_length = value ? 2 : 1

      deterministically_verify -> { @tester.password(min_length: min_length, mix_case: value, special_characters: !value) }, depth: 4 do |password|
        assert_nothing_raised { password }
      end
    end
  end

  def test_domain_name_without_subdomain
    domain_name, domain_suffix = @tester.domain_name.split('.')

    assert domain_name.is_a? String
    assert_includes(%w[example test], domain_suffix)
  end

  def test_domain_name_with_subdomain
    subdomain, domain_name, domain_suffix = @tester.domain_name(
      subdomain: true
    ).split('.')

    assert domain_name.is_a? String
    assert subdomain.is_a? String
    assert_includes(%w[example test], domain_suffix)
  end

  def test_domain_name_with_subdomain_and_with_domain_name_option_given
    subdomain, domain_name, domain_suffix = @tester.domain_name(
      subdomain: true,
      domain: 'customdomain'
    ).split('.')

    assert subdomain.is_a? String
    assert_equal 'customdomain', domain_name
    assert_includes(%w[example test], domain_suffix)
  end

  def test_domain_name_with_subdomain_and_with_full_domain_option_given
    subdomain, domain_name, domain_suffix = @tester.domain_name(
      subdomain: true,
      domain: 'faker-ruby.org'
    ).split('.')

    assert subdomain.is_a? String
    assert_equal 'faker-ruby', domain_name
    assert_equal 'org', domain_suffix
  end

  def test_domain_name_with_subdomain_and_with_domain_option_given_with_domain_suffix
    subdomain, domain_name, domain_suffix = @tester.domain_name(
      subdomain: true,
      domain: 'faker.faker-ruby.org'
    ).split('.')

    assert_equal 'faker', subdomain
    assert_equal 'faker-ruby', domain_name
    assert_equal 'org', domain_suffix
  end

  def test_domain_word
    assert_match(/^[\w-]+$/, @tester.domain_word)
  end

  def test_domain_suffix_with_no_arguments
    result = @tester.domain_suffix

    domain_suffixes_options = %w[com biz info name net org org io co]

    assert_includes(domain_suffixes_options, result)
  end

  def test_domain_suffix_with_arguments
    result = @tester.domain_suffix(safe: true)

    safe_domain_suffixes_options = %w[example test]

    assert_includes(safe_domain_suffixes_options, result)
  end

  def test_ip_v4_address
    assert_equal 3, @tester.ip_v4_address.count('.')

    deterministically_verify -> { @tester.ip_v4_address }, depth: 5 do |address|
      assert address.split('.').map(&:to_i).min >= 0
      assert address.split('.').map(&:to_i).max <= 255
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

    deterministically_verify -> { @tester.private_ip_v4_address }, depth: 5 do |address|
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

    deterministically_verify -> { @tester.public_ip_v4_address }, depth: 5 do |address|
      private.each { |reg| assert_not_match reg, address }
      reserved.each { |reg| assert_not_match reg, address }
    end
  end

  def test_ip_v4_cidr
    assert_match %r(/\d{1,2}$), @tester.ip_v4_cidr

    deterministically_verify -> { @tester.ip_v4_cidr }, depth: 5 do |address|
      assert((1..32).cover?(address.split('/').last.to_i))
    end
  end

  def test_mac_address
    assert_equal 5, @tester.mac_address.count(':')
    assert_equal 5, @tester.mac_address(prefix: '').count(':')

    deterministically_verify -> { @tester.mac_address }, depth: 5 do |address|
      assert address.split(':').map { |d| d.to_i(16) }.max <= 255
    end

    assert @tester.mac_address(prefix: 'fa:fa:fa').start_with?('fa:fa:fa')
    assert @tester.mac_address(prefix: '01:02').start_with?('01:02')
  end

  def test_ip_v6_address
    assert_equal 7, @tester.ip_v6_address.count(':')

    deterministically_verify -> { @tester.ip_v6_address }, depth: 5 do |address|
      assert address.split('.').map { |h| "0x#{h}".hex }.max <= 65_535
    end
  end

  def test_ip_v6_cidr
    assert_match %r{/\d{1,3}$}, @tester.ip_v6_cidr

    deterministically_verify -> { @tester.ip_v6_cidr }, depth: 5 do |address|
      assert((1..128).cover?(address.split('/').last.to_i))
    end
  end

  I18n.config.available_locales.each do |locale|
    define_method("test_#{locale}_slug") do
      Faker::Config.locale = locale

      assert_match(/^[a-z]+(_|-)[a-z]+$/, @tester.slug)
    end

    define_method("test_#{locale}_slug_with_glue_arg") do
      Faker::Config.locale = locale

      assert_match(/^[a-z]+\+[a-z]+$/, @tester.slug(words: nil, glue: '+'))
    end
  end

  def test_slug_with_content_arg
    assert_match(/^foo(_|\.|-)bar(_|\.|-)baz$/, @tester.slug(words: 'Foo bAr baZ'))
  end

  def test_slug_with_unwanted_content_arg
    assert_match(/^foo(_|\.|-)bar(_|\.|-)baz$/, @tester.slug(words: 'Foo.. bAr., baZ,,'))
  end

  def test_url_with_arguments
    deterministically_verify -> { @tester.url(host: 'domain.com', path: '/username', scheme: 'https') } do |result|
      uri = URI.parse(result)

      assert_equal 'https', uri.scheme
      assert_includes('domain.com', uri.host)
      assert_equal '/username', uri.path
    end
  end

  def test_url_with_no_arguments
    deterministically_verify -> { @tester.url } do |result|
      uri = URI.parse(result)

      # example: http://zieme-bosco.example/porsche
      # we just care about the last part here
      suffix = uri.host.split('.').last

      assert_equal 'http', uri.scheme
      assert_includes(%w[example test], suffix)
    end
  end

  def test_device_token
    assert_equal 64, @tester.device_token.size
  end

  def test_user_agent_with_no_argument
    assert_match(/Mozilla|Opera/, @tester.user_agent)
  end

  def test_user_agent_with_valid_argument
    assert_match(/Opera/, @tester.user_agent(vendor: :opera))
    assert_match(/Opera/, @tester.user_agent(vendor: 'opera'))
    assert_match(/Mozilla|Opera/, @tester.user_agent(vendor: nil))
  end

  def test_user_agent_with_invalid_argument
    refute_empty @tester.user_agent(vendor: :ie)
    refute_empty @tester.user_agent(vendor: 1)
  end

  def test_bot_user_agent_with_no_argument
    refute_empty @tester.bot_user_agent
  end

  def test_bot_user_agent_with_valid_argument
    assert_match(/DuckDuckBot/, @tester.bot_user_agent(vendor: :duckduckbot))
    assert_match(/DuckDuckBot/, @tester.bot_user_agent(vendor: 'duckduckbot'))
    refute_empty @tester.bot_user_agent(vendor: nil)
  end

  def test_bot_user_agent_with_invalid_argument
    refute_empty @tester.bot_user_agent(vendor: :ie)
    refute_empty @tester.bot_user_agent(vendor: 1)
  end

  def test_uuid
    uuid = @tester.uuid

    assert_equal(36, uuid.size)
    assert_match(/\A\h{8}-\h{4}-4\h{3}-\h{4}-\h{12}\z/, uuid)
  end

  def test_base64
    assert_match(/[[[:alnum:]]\-_]{16}/, @tester.base64)
    assert_match(/[[[:alnum:]]\-_]{4}/, @tester.base64(length: 4))
    assert_match(/[[[:alnum:]]\-_]{16}=/, @tester.base64(padding: true))
    assert_match(/[[[:alnum:]]+\/]{16}/, @tester.base64(urlsafe: false))
  end

  def test_user_with_args
    user = @tester.user('username', 'email', 'password')

    assert_match(/[a-z]+((_|\.)[a-z]+)?/, user[:username])
    assert_match(/.+@.+\.\w+/, user[:email])
    assert_match(/\w{3}/, user[:password])
  end

  def test_user_without_args
    user = @tester.user

    assert_match(/[a-z]+((_|\.)[a-z]+)?/, user[:username])
    assert_match(/.+@.+\.\w+/, user[:email])
  end

  def test_user_with_invalid_args
    assert_raises NoMethodError do
      @tester.user('xyx')
    end
  end
end
