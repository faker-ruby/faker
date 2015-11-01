require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TesetEnLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_us_states_only_include_states
    assert_equal LoadedYaml['en']['address']['state'].size, 50
    assert_equal LoadedYaml['en']['address']['state'], ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
    assert_equal LoadedYaml['en']['address']['state_abbr'].size, 50
    assert_equal LoadedYaml['en']['address']['state_abbr'], ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY']
  end

  def test_us_zip_codes
    Faker::Config.locale = 'en-US'
    expected = /\d{5}(\-\d{4})?/
    assert_match(expected, Faker::Address.zip_code)
  end

  def test_valid_id_number
    id_num = Faker::IDNumber.valid
    assert Faker::IDNumber::INVALID_SSN.none? { |regex| id_num =~ regex }
  end

  def test_invalid_id_number
    id_num = Faker::IDNumber.invalid
    assert Faker::IDNumber::INVALID_SSN.any? { |regex| id_num =~ regex }
  end

end
