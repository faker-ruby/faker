require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerInternetOmniauth < Test::Unit::TestCase

  def setup
    @tester = Faker::Omniauth
  end

  def test_omniauth_google
    auth = @tester.google

    assert_equal "google_oauth2", auth[:provider]
    assert_equal 9, auth[:uid].length
    assert_equal 2, auth[:info][:name].split(' ').count
    assert_equal "#{auth[:info][:first_name].downcase}@example.com", auth[:info][:email]
    assert_equal auth[:info][:name].split(' ').first, auth[:info][:first_name]
    assert_equal auth[:info][:name].split(' ').last, auth[:info][:last_name]
    assert_instance_of String, auth[:info][:image]
    assert_instance_of String, auth[:credentials][:token]
    assert_instance_of String, auth[:credentials][:refresh_token]
    assert_instance_of Fixnum, auth[:credentials][:expires_at]
    assert_equal true, auth[:credentials][:expires]
    assert_equal 9, auth[:extra][:raw_info][:sub].length
    assert_equal auth[:info][:email], auth[:extra][:raw_info][:email]
    assert_equal true, auth[:extra][:raw_info][:email_verified]
    assert_equal auth[:info][:name], auth[:extra][:raw_info][:name]
    assert_equal auth[:info][:first_name], auth[:extra][:raw_info][:given_name]
    assert_equal auth[:info][:last_name], auth[:extra][:raw_info][:family_name]
    assert_equal "https://plus.google.com/#{auth[:uid]}", auth[:extra][:raw_info][:profile]
    assert_instance_of String, auth[:extra][:raw_info][:picture]
    assert ["female", "male"].include?(auth[:extra][:raw_info][:gender])
    assert_instance_of String, auth[:extra][:raw_info][:birthday]
    assert_equal "en", auth[:extra][:raw_info][:local]
    assert_instance_of String, auth[:extra][:raw_info][:hd]
    assert_equal "accounts.google.com", auth[:id_info]["iss"]
    assert_instance_of String, auth[:id_info]["at_hash"]
    assert_instance_of String, auth[:id_info]["email_verified"]
    assert_equal 28, auth[:id_info]["sub"].length
    assert_equal "APP_ID", auth[:id_info]["azp"]
    assert_equal auth[:info][:email], auth[:id_info]["email"]
    assert_equal "APP_ID", auth[:id_info]["aud"]
    assert_instance_of String, auth[:id_info]["iat"]
    assert_instance_of String, auth[:id_info]["exp"]
    assert_equal "https://www.google.com/accounts/o8/id?id=#{auth[:uid]}",
      auth[:id_info]["openid_id"]
  end

end
