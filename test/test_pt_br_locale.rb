# frozen_string_literal: true

require_relative 'test_helper'

class TestPtBrLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'pt-BR'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_pt_br_address_methods
    assert_kind_of String, Faker::Address.city

    assert_kind_of String, Faker::Address.state_abbr
    assert_match(/^[A-Z]{2}$/, Faker::Address.state_abbr)

    assert_kind_of String, Faker::Address.country

    assert_kind_of String, Faker::Address.building_number
    assert_match(/^([0-9]+)|(s\/n)$/, Faker::Address.building_number)

    assert_kind_of String, Faker::Address.street_suffix

    assert_kind_of String, Faker::Address.secondary_address
    assert_match(/^[a-zA-Z.]+\s[0-9]+$/, Faker::Address.secondary_address)

    assert_kind_of String, Faker::Address.postcode
    assert_match(/^[0-9]{5}-[0-9]{3}$/, Faker::Address.postcode)

    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_name
    assert Faker::Address.default_country, 'Brasil'
  end

  def test_pt_br_phone_methods
    assert_equal('+55', Faker::PhoneNumber.country_code)
  end

  def test_pt_br_color_methods
    assert_kind_of String, Faker::Color.hex_color
    assert_match(/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/, Faker::Color.hex_color)

    assert_kind_of String, Faker::Color.color_name

    assert_kind_of Array, Faker::Color.rgb_color
    Faker::Color.rgb_color.each do |value|
      assert value >= 0 && value <= 255
    end

    assert_kind_of Array, Faker::Color.hsl_color
    hue = Faker::Color.hsl_color[0]

    assert hue >= 0 && hue <= 360
    Faker::Color.hsl_color[1..2].each do |value|
      assert value >= 0 && value <= 1
    end

    assert_kind_of Array, Faker::Color.hsla_color
    assert_kind_of Array, Faker::Color.hsl_color
    hue = Faker::Color.hsl_color[0]

    assert hue >= 0 && hue <= 360
    Faker::Color.hsl_color[1..3].each do |value|
      assert value >= 0 && value <= 1
    end
  end

  def test_pt_br_company_methods
    assert_kind_of String, Faker::Company.name
    assert_kind_of String, Faker::Company.suffix
  end

  def test_pt_br_commerce_methods
    assert_kind_of String, Faker::Commerce.color
    assert_kind_of String, Faker::Commerce.department
    assert_kind_of String, Faker::Commerce.product_name
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.name
  end

  def test_pt_br_food_methods
    assert_kind_of String, Faker::Food.ingredient
    assert_kind_of String, Faker::Food.spice
    assert_kind_of String, Faker::Food.measurement
  end

  def test_pt_br_internet_methods
    deterministically_verify -> { Faker::Internet.email } do |result|
      name, domain = result.split('@')
      domain_name, domain_suffix = domain.split('.')

      assert_kind_of String, name
      assert_kind_of String, domain_name
      assert_includes(%w[example test], domain_suffix)
      assert_match(/^[a-z0-9._-]+@[a-z0-9]+.[a-z]+.([a-z]+)?$/i, result)
    end
  end

  def test_pt_br_job_methods
    assert_kind_of String, Faker::Job.field
    assert_kind_of String, Faker::Job.seniority
    assert_kind_of String, Faker::Job.position
    assert_kind_of String, Faker::Job.key_skills
    assert_kind_of String, Faker::Job.employment_type
    assert_kind_of String, Faker::Job.education_level
    assert_kind_of String, Faker::Job.title
  end

  def test_pt_br_name_methods
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.suffix
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.middle_name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_kind_of String, Faker::Name.male_first_name
    assert_kind_of String, Faker::Name.female_first_name
    assert_kind_of String, Faker::Name.name
    assert_match(/[A-Z]{3}/, Faker::Name.initials)
    assert_match(/[A-Z]{2}/, Faker::Name.initials(number: 2))
  end

  def test_pt_br_team_methods
    assert_kind_of String, Faker::Team.main_teams
    assert_kind_of String, Faker::Team.prefix
    assert_kind_of String, Faker::Team.gentile
    assert_kind_of String, Faker::Team.name
    assert_kind_of String, Faker::Team.sport
  end

  def test_pt_br_university_methods
    assert_kind_of String, Faker::University.prefix
    assert_kind_of String, Faker::University.region
    assert_kind_of String, Faker::University.suffix
    assert_kind_of String, Faker::University.name
  end

  def test_pt_br_vehicle_methods
    assert_kind_of String, Faker::Vehicle.license_plate
    assert_match(/(^[A-Z]{3}-[0-9]{4})|([A-Z]{3}[0-9]{1}[A-Z][0-9]{2})|([A-Z]{3}[0-9]{2}[A-Z][0-9])/, Faker::Vehicle.license_plate)

    assert_kind_of String, Faker::Vehicle.license_plate(state_abbreviation: 'RJ')
    assert_match(/^[A-Z]{3}-[0-9]{4}/, Faker::Vehicle.license_plate(state_abbreviation: 'RJ'))
  end

  def test_pt_br_gender_methods
    assert_kind_of String, Faker::Gender.type
    assert_includes(['Feminino', 'Masculino', 'Não Binário', 'Agênero', 'Gênero Fluido', 'Gênero queer', 'Bigênero', 'Poligênero'], Faker::Gender.type)
    assert_kind_of String, Faker::Gender.binary_type
    assert_includes(%w[Feminino Masculino], Faker::Gender.binary_type)
  end

  def test_pt_br_animal_methods
    assert_kind_of String, Faker::Creature::Animal.name
  end
end
