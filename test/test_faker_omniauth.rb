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
    plus_url        = "https://plus.google.com/#{auth[:uid]}"
    openid_id       = "https://www.google.com/accounts/o8/id?id=#{auth[:uid]}"

    assert_equal "google_oauth2", provider
    assert_equal 9, uid.length
    assert_equal 2, word_count(info[:name])
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
    assert [true, false].include? extra_raw_info[:email_verified]
    assert_equal info[:name], extra_raw_info[:name]
    assert_equal info[:first_name], extra_raw_info[:given_name]
    assert_equal info[:last_name], extra_raw_info[:family_name]
    assert_equal plus_url, extra_raw_info[:profile]
    assert_instance_of String, extra_raw_info[:picture]
    assert is_gender?(extra_raw_info[:gender])
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
    assert_equal openid_id, id_info["openid_id"]
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
    email           = "#{info[:first_name].downcase}@#{info[:last_name].downcase}.com"
    url             = "http://www.facebook.com/#{username}"

    assert_equal "facebook", provider
    assert_equal 7, uid.length
    assert_equal email, info[:email]
    assert_equal 2, word_count(info[:name])
    assert_instance_of String, info[:first_name]
    assert_instance_of String, info[:last_name]
    assert_instance_of String, info[:image]
    assert is_boolean?(info[:verified])
    assert_instance_of String, credentials[:token]
    assert_instance_of Fixnum, credentials[:expires_at]
    assert_equal true, credentials[:expires]
    assert_equal uid, extra_raw_info[:id]
    assert_equal info[:name], extra_raw_info[:name]
    assert_equal info[:first_name], extra_raw_info[:first_name]
    assert_equal info[:last_name], extra_raw_info[:last_name]
    assert_equal url, extra_raw_info[:link]
    assert_equal username, extra_raw_info[:username]
    assert_equal 9, location[:id].length
    assert_instance_of String, location[:name]
    assert is_gender?(extra_raw_info[:gender])
    assert_equal info[:email], extra_raw_info[:email]
    assert_instance_of Fixnum, extra_raw_info[:timezone]
    assert_instance_of String, extra_raw_info[:locale]
    assert is_boolean?(extra_raw_info[:verified])
    assert_instance_of String, extra_raw_info[:updated_time]
  end

  def test_omniauth_twitter
    auth            = @tester.twitter
    provider        = auth[:provider]
    uid             = auth[:uid]
    info            = auth[:info]
    urls            = info[:urls]
    credentials     = auth[:credentials]
    access_token    = auth[:extra][:access_token]
    raw_info        = auth[:extra][:raw_info]
    url             = "https://twitter.com/#{info[:nickname]}"

    assert_equal "twitter", provider
    assert_equal 6, uid.length
    assert_equal info[:name].downcase.gsub(' ', ''), info[:nickname]
    assert_equal 2, word_count(info[:name])
    assert_equal 2, info[:location].split(', ').length
    assert_instance_of String, info[:image]
    assert_instance_of String, info[:description]
    assert_equal nil, urls[:Website]
    assert_equal url, urls[:Twitter]
    assert_instance_of String, credentials[:token]
    assert_instance_of String, credentials[:secret]
    assert_instance_of String, access_token
    assert_equal info[:name], raw_info[:name]
    assert_instance_of Fixnum, raw_info[:listed_count]
    assert_instance_of String, raw_info[:profile_sidebar_border_color]
    refute raw_info[:url]
    assert_equal "en", raw_info[:lang]
    assert_instance_of Fixnum, raw_info[:statuses_count]
    assert_instance_of String, raw_info[:profile_image_url]
    assert_instance_of String, raw_info[:profile_background_image_url_https]
    assert_equal info[:location], raw_info[:location]
    assert_instance_of String, raw_info[:time_zone]
    assert is_boolean?(raw_info[:follow_request_sent])
    assert_equal uid, raw_info[:id]
    assert is_boolean?(raw_info[:profile_background_tile])
    assert_instance_of String, raw_info[:profile_sidebar_fill_color]
    assert_instance_of Fixnum, raw_info[:followers_count]
    assert is_boolean?(raw_info[:default_profile_image])
    assert_equal "", raw_info[:screen_name]
    assert is_boolean?(raw_info[:following])
    assert_instance_of Fixnum, raw_info[:utc_offset]
    assert is_boolean?(raw_info[:verified])
    assert_instance_of Fixnum, raw_info[:favourites_count]
    assert_instance_of String, raw_info[:profile_background_color]
    assert is_boolean?(raw_info[:is_translator])
    assert_instance_of Fixnum, raw_info[:friends_count]
    assert is_boolean?(raw_info[:notifications])
    assert is_boolean?(raw_info[:geo_enabled])
    assert_instance_of String, raw_info[:profile_background_image_url]
    assert is_boolean?(raw_info[:protected])
    assert_equal info[:description], raw_info[:description]
    assert_instance_of String, raw_info[:profile_link_color]
    assert_instance_of String, raw_info[:created_at]
    assert_equal uid, raw_info[:id_str]
    assert_instance_of String, raw_info[:profile_image_url_https]
    assert is_boolean?(raw_info[:default_profile])
    assert is_boolean?(raw_info[:profile_use_background_image])
    assert_instance_of Array, raw_info[:entities][:description][:urls]
    assert_instance_of String, raw_info[:profile_text_color]
    assert is_boolean?(raw_info[:contributors_enabled])
  end

  def test_omniauth_linkedin
    auth            = @tester.linkedin
    provider        = auth["provider"]
    uid             = auth["uid"]
    info            = auth["info"]
    credentials     = auth["credentials"]
    extra           = auth["extra"]
    access_token    = extra["access_token"]
    params          = access_token["params"]
    raw_info        = extra["raw_info"]
    first_name      = info['first_name'].downcase
    last_name       = info['last_name'].downcase
    url             = "http://www.linkedin.com/in/#{first_name}#{last_name}"
    email           = "#{first_name}@#{last_name}.com"

    assert_equal "linkedin", provider
    assert_equal 6, uid.length
    assert_equal 2, word_count(info["name"])
    assert_equal email, info["email"]
    assert_equal info["name"], info["nickname"]
    assert_instance_of String, info["first_name"]
    assert_instance_of String, info["last_name"]
    assert_equal 2, info["location"].split(', ').count
    assert_instance_of String, info["description"]
    assert_instance_of String, info["image"]
    assert_instance_of String, info["phone"]
    assert_instance_of String, info["headline"]
    assert_instance_of String, info["industry"]
    assert_equal url, info["urls"]["public_profile"]
    assert_instance_of String, credentials["token"]
    assert_instance_of String, credentials["secret"]
    assert_equal credentials["token"], access_token["token"]
    assert_equal credentials["secret"], access_token["secret"]
    refute access_token["consumer"]
    assert_equal credentials["token"], params[:oauth_token]
    assert_equal credentials["secret"], params[:oauth_token_secret]
    assert_instance_of Fixnum, params[:oauth_expires_in]
    assert_instance_of Fixnum, params[:oauth_authorization_expires_in]
    refute access_token["response"]
    assert_equal info["first_name"], raw_info["firstName"]
    assert_equal info["headline"], raw_info["headline"]
    assert_equal uid, raw_info["id"]
    assert_equal info["industry"], raw_info["industry"]
    assert_equal info["last_name"], raw_info["lastName"]
    assert_instance_of String, raw_info["location"]["country"]["code"]
    assert_instance_of String, raw_info["location"]["name"]
    assert_instance_of String, raw_info["pictureUrl"]
    assert_equal info["urls"]["public_profile"], raw_info["publicProfileUrl"]
  end

  def word_count(string)
    string.split(' ').length
  end

  def is_boolean?(test)
    !!test == test
  end

  def is_gender?(test)
    ["female", "male"].include?(test)
  end
end
