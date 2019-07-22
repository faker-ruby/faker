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
    assert Faker::Address.city.is_a? String

    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.state_abbr.match(/^[A-Z]{2}$/)

    assert Faker::Address.country.is_a? String

    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.building_number.match(/^([0-9]+)|(s\/n)$/)

    assert Faker::Address.street_suffix.is_a? String

    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.secondary_address.match(/^[a-zA-Z\.]+\s[0-9]+$/)

    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.postcode.match(/^[0-9]{5}\-[0-9]{3}$/)

    assert Faker::Address.state.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.default_country, 'Brasil'
  end

  def test_pt_br_color_methods
    assert Faker::Color.hex_color.is_a? String
    assert Faker::Color.hex_color.match(/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/)

    assert Faker::Color.color_name.is_a? String

    assert Faker::Color.rgb_color.is_a? Array
    Faker::Color.rgb_color.each do |value|
      assert value >= 0 && value <= 255
    end

    assert Faker::Color.hsl_color.is_a? Array
    hue = Faker::Color.hsl_color[0]
    assert hue >= 0 && hue <= 360
    Faker::Color.hsl_color[1..2].each do |value|
      assert value >= 0 && value <= 1
    end

    assert Faker::Color.hsla_color.is_a? Array
    assert Faker::Color.hsl_color.is_a? Array
    hue = Faker::Color.hsl_color[0]
    assert hue >= 0 && hue <= 360
    Faker::Color.hsl_color[1..3].each do |value|
      assert value >= 0 && value <= 1
    end
  end

  def test_pt_br_company_methods
    assert Faker::Company.name.is_a? String
    assert Faker::Company.suffix.is_a? String
  end

  def test_pt_br_commerce_methods
    assert Faker::Commerce.color.is_a? String
    assert Faker::Commerce.department.is_a? String
    assert Faker::Commerce.product_name.is_a? String
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_pt_br_food_methods
    assert Faker::Food.ingredient.is_a? String
    assert Faker::Food.spice.is_a? String
    assert Faker::Food.measurement.is_a? String
  end

  def test_pt_br_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.free_email.match(/^[a-z0-9._\-]+@[a-z0-9]+.[a-z]+.([a-z]+)?$/i)

    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_pt_br_job_methods
    assert Faker::Job.field.is_a? String
    assert Faker::Job.seniority.is_a? String
    assert Faker::Job.position.is_a? String
    assert Faker::Job.key_skills.is_a? String
    assert Faker::Job.employment_type.is_a? String
    assert Faker::Job.education_level.is_a? String
    assert Faker::Job.title.is_a? String
  end

  def test_pt_br_name_methods
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.suffix.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.middle_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.initials.match(/[A-Z]{3}/)
    assert Faker::Name.initials(character_count: 2).match(/[A-Z]{2}/)
  end

  def test_pt_br_team_methods
    assert Faker::Team.main_teams.is_a? String
    assert Faker::Team.prefix.is_a? String
    assert Faker::Team.gentile.is_a? String
    assert Faker::Team.name.is_a? String
    assert Faker::Team.sport.is_a? String
  end

  def test_pt_br_university_methods
    assert Faker::University.prefix.is_a? String
    assert Faker::University.region.is_a? String
    assert Faker::University.suffix.is_a? String
    assert Faker::University.name.is_a? String
  end

  def test_pt_br_vehicle_methods
    assert Faker::Vehicle.license_plate.is_a? String
    assert Faker::Vehicle.license_plate.match(/^[A-Z]{3}\-[0-9]{4}/)

    assert Faker::Vehicle.license_plate(state_abreviation: 'RJ').is_a? String
    assert Faker::Vehicle.license_plate(state_abreviation: 'RJ').match(/^[A-Z]{3}\-[0-9]{4}/)
  end

  def test_pt_br_gender_methods
    assert Faker::Gender.type.is_a? String
    assert_includes(['Feminino', 'Masculino', 'Não Binário', 'Agênero', 'Gênero Fluido', 'Gênero queer', 'Bigênero', 'Poligênero'], Faker::Gender.type)
    assert Faker::Gender.binary_type.is_a? String
    assert_includes(%w[Feminino Masculino], Faker::Gender.binary_type)
  end
end
