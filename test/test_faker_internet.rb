require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerInternet < Test::Unit::TestCase

  def setup
    @tester = Faker::Internet
  end

  def test_email
    assert @tester.email.match(/.+@.+\.\w+/)
  end

  def test_free_email
    assert @tester.free_email.match(/.+@(gmail|hotmail|yahoo)\.com/)
  end

  def test_safe_email
    assert @tester.safe_email.match(/.+@example.(com|net|org)/)
  end

  def test_user_name
    assert @tester.user_name.match(/[a-z]+((_|\.)[a-z]+)?/)
  end

  def test_user_name_with_string_arg
    assert @tester.user_name('bo peep').match(/(bo(_|\.)peep|peep(_|\.)bo)/)
  end

  def test_user_name_with_integer_arg
    (1..32).each do |min_length|
      assert @tester.user_name(min_length).length >= min_length
    end
  end

  def test_user_name_with_closed_range_arg
    (1..32).each do |min_length|
      (min_length..32).each do |max_length|
        l = @tester.user_name((min_length..max_length)).length
        assert l >= min_length
        assert l <= max_length
      end
    end
  end

  def test_user_name_with_open_range_arg
    (1..32).each do |min_length|
      (min_length+1..33).each do |max_length|
        l = @tester.user_name((min_length...max_length)).length
        assert l >= min_length
        assert l <= max_length-1
      end
    end
  end

  def test_user_name_with_range_and_separators
    (1..32).each do |min_length|
      (min_length+1..33).each do |max_length|
        u = @tester.user_name((min_length...max_length), %w(=))
        assert u.length.between? min_length, max_length-1
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

  def test_domain_name
    assert @tester.domain_name.match(/\w+\.\w+/)
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
      assert @tester.ip_v4_address.split('.').map{|octet| octet.to_i}.max <= 255
    end
  end

  def test_public_ip_v4_address
    ten_dot = /^10\./
    one_two_seven = /^127\./
    one_six_nine = /^169\.254/
    one_nine_two = /^192\.168\./
    one_seven_two = /^172\.(16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31)\./

    1000.times do
      address = @tester.public_ip_v4_address
      assert_not_match ten_dot, address
      assert_not_match one_two_seven, address
      assert_not_match one_six_nine, address
      assert_not_match one_nine_two, address
      assert_not_match one_seven_two, address
    end
  end

  def test_mac_address
    assert_equal 5, @tester.mac_address.count(':')
    assert_equal 5, @tester.mac_address("").count(':')

    100.times do
      assert @tester.mac_address.split(':').map{|d| d.to_i(16)}.max <= 255
    end

    assert @tester.mac_address("fa:fa:fa").start_with?("fa:fa:fa")
    assert @tester.mac_address("01:02").start_with?("01:02")
  end

  def test_ip_v6_address
    assert_equal 7, @tester.ip_v6_address.count(':')

    100.times do
      assert @tester.ip_v6_address.split('.').map{|h| "0x#{h}".hex}.max <= 65535
    end
  end

  def test_slug
    assert @tester.slug.match(/^[a-z]+(_|\.|\-)[a-z]+$/)
  end

  def test_slug_with_content_arg
    assert @tester.slug('Foo bAr baZ').match(/^foo(_|\.|\-)bar(_|\.|\-)baz$/)
  end

  def test_slug_with_glue_arg
    assert @tester.slug(nil, '+').match(/^[a-z]+\+[a-z]+$/)
  end

  def test_url
    assert @tester.url('domain.com', '/username').match(/^http:\/\/domain\.com\/username$/)
  end

  def test_device_token
    assert_equal 64, @tester.device_token.size
  end
end
