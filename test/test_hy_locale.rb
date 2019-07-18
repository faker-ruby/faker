# frozen_string_literal: true

require_relative 'test_helper'

class TestHyLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'hy'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_hy_address_methods
    assert_kind_of String, Faker::Address.country
    assert_equal 'Ամերիկայի Միացյալ Նահանգներ', Faker::Address.country_by_code(code: 'US')
    assert_equal 'Հայաստան', Faker::Address.default_country
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.community
    assert_kind_of String, Faker::Address.city
    assert_equal 'ք.', Faker::Address.city_prefix
    assert_empty Faker::Address.city_suffix
    assert_kind_of String, Faker::Address.village
    assert_equal 'գ.', Faker::Address.village_prefix
    assert Faker::Address.zip_code.start_with?('0', '1', '2', '3', '4')
    assert Faker::Address.zip('ԱԳ').start_with?('02', '03', '04', '05')
    assert Faker::Address.zip('ԱՐ').start_with?('06', '07', '08')
    assert Faker::Address.zip('ԱՄ').start_with?('09', '10', '11')
    assert Faker::Address.zip('ԳՂ').start_with?('12', '13', '14', '15', '16')
    assert Faker::Address.zip('ԼՌ').start_with?('17', '18', '19', '20', '21')
    assert Faker::Address.zip('ԿՏ').start_with?('22', '23', '24', '25')
    assert Faker::Address.zip('ՇԿ').start_with?('26', '27', '28', '29', '30', '31')
    assert Faker::Address.zip('ՍՅ').start_with?('32', '33', '34', '35')
    assert Faker::Address.zip('ՎՁ').start_with?('36', '37', '38')
    assert Faker::Address.zip('ՏՎ').start_with?('39', '40', '41', '42')
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_includes %w[փողոց պողոտա], Faker::Address.street_suffix
    assert_includes 1..3, Faker::Address.building_number.size
    assert Faker::Address.secondary_address.start_with?('բն. ')
    assert_kind_of String, Faker::Address.full_address
  end

  def test_hy_artist_methods
    assert_kind_of String, Faker::Artist.name
  end

  def test_hy_book_methods
    assert_kind_of String, Faker::Book.title
    assert_kind_of String, Faker::Book.author
    assert_kind_of String, Faker::Book.publisher
    assert_kind_of String, Faker::Book.genre
  end

  def test_hy_color_methods
    assert_kind_of String, Faker::Color.color_name
  end

  def test_hy_commerce_methods
    assert_kind_of String, Faker::Commerce.color
    assert_kind_of String, Faker::Commerce.department
    assert_kind_of String, Faker::Commerce.material
    assert_kind_of String, Faker::Commerce.product_name
    assert_kind_of String, Faker::Commerce.promotion_code
  end

  def test_hy_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.buzzword
    assert_kind_of String, Faker::Company.bs
    assert_kind_of String, Faker::Company.name
    assert_kind_of String, Faker::Company.industry
    assert_kind_of String, Faker::Company.catch_phrase
    assert_kind_of String, Faker::Company.profession
    assert_kind_of String, Faker::Company.type
  end

  def test_hy_compass_methods
    assert_kind_of String, Faker::Compass.abbreviation
    assert_kind_of String, Faker::Compass.cardinal
    assert_kind_of String, Faker::Compass.cardinal_abbreviation
    assert_kind_of String, Faker::Compass.direction
    assert_kind_of String, Faker::Compass.half_wind
    assert_kind_of String, Faker::Compass.half_wind_abbreviation
    assert_kind_of String, Faker::Compass.ordinal
    assert_kind_of String, Faker::Compass.ordinal_abbreviation
  end

  def test_hy_currency_methods
    assert_kind_of String, Faker::Currency.name
  end

  def test_hy_food_methods
    assert_kind_of String, Faker::Food.dish
    assert_kind_of String, Faker::Food.descriptions
    assert_kind_of String, Faker::Food.ingredients
    assert_kind_of String, Faker::Food.fruits
    assert_kind_of String, Faker::Food.vegetables
    assert_kind_of String, Faker::Food.spices
    assert_kind_of String, Faker::Food.measurements
    assert_kind_of String, Faker::Food.metric_measurements
  end

  def test_hy_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.free_email
    assert_kind_of String, Faker::Internet.safe_email
    assert_kind_of String, Faker::Internet.domain_name
    assert_kind_of String, Faker::Internet.domain_suffix
    assert_kind_of String, Faker::Internet.domain_word
  end

  def test_hy_job_methods
    assert_kind_of String, Faker::Job.field
    assert_kind_of String, Faker::Job.seniority
    assert_kind_of String, Faker::Job.position
    assert_kind_of String, Faker::Job.key_skills
    assert_kind_of String, Faker::Job.employment_type
    assert_kind_of String, Faker::Job.education_level
    assert_kind_of String, Faker::Job.title
  end

  def test_hy_military_methods
    assert_kind_of String, Faker::Military.army_rank
  end

  def test_hy_name_methods
    assert_kind_of String, Faker::Name.male_first_name
    assert_kind_of String, Faker::Name.female_first_name
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_hy_nation_methods
    assert_kind_of String, Faker::Nation.nationality
    assert_kind_of String, Faker::Nation.language
    assert_kind_of String, Faker::Nation.capital_city
  end

  def test_hy_phone_number_methods
    assert_kind_of String, Faker::PhoneNumber.cell_phone
    assert_kind_of String, Faker::PhoneNumber.phone_number
    assert_includes ['+1-374', '+374'], Faker::PhoneNumber.country_code
  end

  def test_hy_science_methods
    assert_kind_of String, Faker::Science.element
    assert_kind_of String, Faker::Science.scientist
  end

  def test_hy_space_methods
    assert_kind_of String, Faker::Space.planet
    assert_kind_of String, Faker::Space.moon
    assert_kind_of String, Faker::Space.galaxy
    assert_kind_of String, Faker::Space.nebula
    assert_kind_of String, Faker::Space.constellation
    assert_kind_of String, Faker::Space.star
    assert_kind_of String, Faker::Space.distance_measurement
    assert_kind_of String, Faker::Space.meteorite
  end
end
