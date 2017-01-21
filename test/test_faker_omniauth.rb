require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerInternetOmniauth < Test::Unit::TestCase

  def setup
    @tester = Faker::Omniauth
  end

  def test_omniauth_google
    auth            = @tester.google
    provider        = auth[:provider]
    uid             = auth[:uid]
    info            = auth[:info]
    credentials     = auth[:credentials]
    extra_raw_info  = auth[:extra][:raw_info]
    id_info         = auth[:id_info]

    assert_equal "google_oauth2", provider
    assert_equal 9, uid.length
    assert_equal 2, info[:name].split(' ').count
    assert_equal "#{info[:first_name].downcase}@example.com", info[:email]
    assert_equal info[:name].split(' ').first, info[:first_name]
    assert_equal info[:name].split(' ').last, info[:last_name]
    assert_instance_of String, info[:image]
    assert_instance_of String, credentials[:token]
    assert_instance_of String, credentials[:refresh_token]
    assert_instance_of Fixnum, credentials[:expires_at]
    assert_equal true, credentials[:expires]
    assert_equal 9, extra_raw_info[:sub].length
    assert_equal info[:email], extra_raw_info[:email]
    assert_equal true, extra_raw_info[:email_verified]
    assert_equal info[:name], extra_raw_info[:name]
    assert_equal info[:first_name], extra_raw_info[:given_name]
    assert_equal info[:last_name], extra_raw_info[:family_name]
    assert_equal "https://plus.google.com/#{auth[:uid]}", extra_raw_info[:profile]
    assert_instance_of String, extra_raw_info[:picture]
    assert ["female", "male"].include?(extra_raw_info[:gender])
    assert_instance_of String, extra_raw_info[:birthday]
    assert_equal "en", extra_raw_info[:local]
    assert_instance_of String, extra_raw_info[:hd]
    assert_equal "accounts.google.com", id_info["iss"]
    assert_instance_of String, id_info["at_hash"]
    assert_instance_of String, id_info["email_verified"]
    assert_equal 28, id_info["sub"].length
    assert_equal "APP_ID", id_info["azp"]
    assert_equal info[:email], id_info["email"]
    assert_equal "APP_ID", id_info["aud"]
    assert_instance_of String, id_info["iat"]
    assert_instance_of String, id_info["exp"]
    assert_equal "https://www.google.com/accounts/o8/id?id=#{auth[:uid]}",
      id_info["openid_id"]
  end

  def test_omniauth_facebook
    auth            = @tester.facebook
    provider        = auth[:provider]
    uid             = auth[:uid]
    info            = auth[:info]
    credentials     = auth[:credentials]
    extra_raw_info  = auth[:extra][:raw_info]
    username        = (info[:first_name][0] + info[:last_name]).downcase
    location        = extra_raw_info[:location]

    assert_equal "facebook", provider
    assert_equal 7, uid.length
    assert_equal "#{info[:first_name].downcase}@#{info[:last_name].downcase}.com",
      info[:email]
    assert_equal 2, info[:name].split(' ').count
    assert_instance_of String, info[:first_name]
    assert_instance_of String, info[:last_name]
    assert_instance_of String, info[:image]
    assert_equal true, info[:verified]
    assert_instance_of String, credentials[:token]
    assert_instance_of Fixnum, credentials[:expires_at]
    assert_equal true, credentials[:expires]
    assert_equal uid, extra_raw_info[:id]
    assert_equal info[:name], extra_raw_info[:name]
    assert_equal info[:first_name], extra_raw_info[:first_name]
    assert_equal info[:last_name], extra_raw_info[:last_name]
    assert_equal "http://www.facebook.com/#{username}", extra_raw_info[:link]
    assert_equal username, extra_raw_info[:username]
    assert_equal 9, location[:id].length
    assert_instance_of String, location[:name]
    assert ["female", "male"].include?(extra_raw_info[:gender])
    assert_equal info[:email], extra_raw_info[:email]
    assert_instance_of Fixnum, extra_raw_info[:timezone]
    assert_instance_of String, extra_raw_info[:locale]
    assert_equal true, extra_raw_info[:verified]
    assert_instance_of String, extra_raw_info[:updated_time]
  end
end
