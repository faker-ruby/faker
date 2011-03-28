require "test/unit"

require "faker"

class TestLocale < Test::Unit::TestCase
  def test_case_name
    I18n.locale = :en
    Faker::Config.locale = :de
    assert Faker::PhoneNumber.phone_number.match(/\(0\d+\) \d+|\+49-\d+-\d+/)
    assert Faker::Address.street_name.match(//)
  end
end

# formats: ['(0###) #########', '(0####) #######', '+49-###-#######', '+49-####-########']
