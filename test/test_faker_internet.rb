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
  
  def test_user_name_with_arg
    assert @tester.user_name('bo peep').match(/(bo(_|\.)peep|peep(_|\.)bo)/)
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

    1000.times do
      assert @tester.ip_v4_address.split('.').map{|octet| octet.to_i}.max <= 255
    end
  end

  def test_ip_v6_address
    assert_equal 7, @tester.ip_v6_address.count(':')

    1000.times do
      assert @tester.ip_v6_address.split('.').map{|h| "0x#{h}".hex}.max <= 65535
    end
  end
end
