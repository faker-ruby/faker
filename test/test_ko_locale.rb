# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestKoLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'ko'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_ko_locale_name
    assert Faker::Name.name.match(/[가-힇] [가-힇]{2}/)
  end

  def test_ko_locale_email
    assert Faker::Internet.email.match(/.+@.+\.(\w{2,3}){1,2}/)
  end

  def test_ko_locale_free_email
    assert Faker::Internet.free_email.match(/.+@(gmail\.com|yahoo\.co\.kr|hanmail\.net|naver\.com)/)
  end

  def test_ko_locale_safe_email
    assert Faker::Internet.safe_email.match(/.+@example.(com|net|org)/)
  end

  def test_ko_locale_user_name
    assert Faker::Internet.user_name.match(/[a-z]+((_|\.)[a-z]+)?/)
  end
end
