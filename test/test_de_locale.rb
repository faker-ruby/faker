require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestDeLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'de'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_de_methods
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.country.is_a? String
    assert Faker::Address.street_root.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.legal_form.is_a? String
    assert Faker::Company.name.is_a? String
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
    assert Faker::Lorem.words.is_a? Array
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.nobility_title_prefix.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Book.title.is_a? String
    assert Faker::Book.author.is_a? String
    assert Faker::Book.publisher.is_a? String



    assert Faker::Food.ingredient.is_a? String
    assert Faker::Food.spice.is_a? String
    assert Faker::Food.measurement.is_a? String
    
    assert Faker::Music.instrument.is_a? String

    assert Faker::Pokemon.name.is_a? String

    assert Faker::Space.planet.is_a? String
    assert Faker::Space.moon.is_a? String
    assert Faker::Space.nebula.is_a? String
    assert Faker::Space.star_cluster.is_a? String
    assert Faker::Space.constellation.is_a? String
    assert Faker::Space.agency.is_a? String
    assert Faker::Space.galaxy.is_a? String
    assert Faker::Space.star.is_a? String
    assert Faker::Space.distance_measurement.is_a? String
  end

  def test_de_cell_phone_countrycode
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/,'')
    assert_equal '4', mobile[0]
    assert_equal '9', mobile[1]
  end
end
