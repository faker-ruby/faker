require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestLocaleSwitcher < Test::Unit::TestCase
  def test_internet_zh_tw_to_en
    Faker::Config.locale = "zh-TW"
    assert Faker::LocaleSwitcher.switch(:internet) == "en"
  end
end
