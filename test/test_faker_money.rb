require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerMoney < Test::Unit::TestCase

  def setup
    @tester = Faker::Money
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_money
    assert_instance_of Float, @tester.money
    assert_includes 0..100, @tester.money
    assert_includes 500..1000, @tester.money(500, 1000)
    assert_instance_of Fixnum, @tester.money(10,30,0)
  end

  def test_money_when_zero_decimals
    Faker::Config.locale = "ko"
    assert_instance_of Fixnum, @tester.money
    assert_includes 0..100, @tester.money

    Faker::Config.locale = "ja"
    assert_instance_of Fixnum, @tester.money
    assert_includes 40..60, @tester.money(40,60)

    Faker::Config.locale = :vi
    assert_instance_of Fixnum, @tester.money
    assert_includes 500..1000, @tester.money(500, 1000, 5)
  end

  def test_money_with_zero_padding
    assert_instance_of String, @tester.money_with_zero_padding
    assert @tester.money_with_zero_padding(100,900).match(/\d{3}\.\d{2}/)
    assert @tester.money_with_zero_padding(100,900,0).match(/\d{3}/)
  end

  def test_money_with_symbol
    Faker::Config.locale = :en
    assert @tester.money_with_symbol.match(/\$\d{1,2}\.\d{2}/)
    Faker::Config.locale = :sk
    assert @tester.money_with_symbol(300,700,3).match(/\€\d{3}\.\d{3}/)
    Faker::Config.locale = 'pl'
    assert @tester.money_with_symbol(10,20).match(/zł\d{2}\.\d{2}/)
  end

  def test_money_with_symbol_when_non_decimal
    Faker::Config.locale = 'ko'
    assert @tester.money_with_symbol(50000,80000).match(/\₩\d{5}/)
    Faker::Config.locale = 'en'
    assert @tester.money_with_symbol(300,500,0).match(/\$\d{3}/)
  end

  def test_money_without_cents
    assert_instance_of Fixnum, @tester.money_without_cents
    assert_includes 0..100, @tester.money_without_cents
    assert_includes 70..90, @tester.money_without_cents(70,90)
  end

  def test_money_without_cents_with_symbol
    Faker::Config.locale = :en
    assert @tester.money_without_cents_with_symbol.match(/\$\d{1,2}/)
    Faker::Config.locale = :de
    assert @tester.money_without_cents_with_symbol(300,700).match(/\€\d{3}/)
    Faker::Config.locale = 'en-GB'
    assert @tester.money_without_cents_with_symbol(10,20).match(/\£\d{2}/)
  end

end
