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
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.country.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.default_country, 'Brasil'
  end

  def test_pt_br_color_methods
    assert Faker::Color.name.is_a? String
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
    assert Faker::Internet.domain_suffix.is_a? String
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
    assert Faker::Name.initials(2).match(/[A-Z]{2}/)
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
    assert Faker::Vehicle.license_plate('RJ').is_a? String
  end
end
