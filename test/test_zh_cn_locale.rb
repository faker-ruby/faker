require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestZhCnLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'zh-CN'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_validity_of_phone_method_output
    cn_cell_phone_validation_regex = /^1(3[0-9]|4[57]|5[0-35-9]|7[0-35-8]|8[0-9])\d{8}$/
    assert_match(cn_cell_phone_validation_regex, Faker::PhoneNumber.cell_phone)
  end

end
