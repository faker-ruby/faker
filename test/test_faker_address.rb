require File.dirname(__FILE__) + '/test_helper.rb'

class TestAddress < Test::Unit::TestCase

  def setup
    xx = {
      :faker => {
        :address => {
          :city_root => [:stone],
          :city_suffix => [:ledge],
          :city_formats => [[:city_root, :city_suffix]],
          :secondary_address => ['Oppg. ? Leil. ##'],
          :street_suffix => [:blvd]
        },
        :name => {:first_name => [:beth], :last_name => [:wainwright]}
      }
    }
    xy = {
      :faker => {
        :address => {
          :city_prefix => [:new],
          :city_suffix => [:burg],
          :street_name_formats => [[:street_root, :street_suffix]],
          :street_root => [:hi],
          :street_suffix => [:gate],
        },
        :name => {:first_name => [:thomas], :last_name => [:andersen]}
      }
    }

    I18n.backend.store_translations(:xx, xx)
    I18n.backend.store_translations(:xy, xy)
  end

  def test_city_root_with_translation
    I18n.with_locale(:xx) do
      assert_equal :stone, Faker::Address.city_root
    end
  end

  def test_city_root_defaults_to_first_name
     I18n.with_locale(:xy) do
      assert_equal :thomas, Faker::Address.city_root
    end
  end

  def test_city_root_can_override_to_last_name
    I18n.with_locale(:xy) do
      assert_equal :andersen, Faker::Address.city_root(:last_name)
    end
  end

  def test_city_formats_defaults_to_existing
    I18n.with_locale(:xy) do
      city = Faker::Address.city
      expected = ['new thomas', 'new thomasburg', 'thomasburg', 'andersenburg']
      assert expected.include?(city), "Expected #{city} to be included in [#{expected.join(', ')}]"
    end
  end

  def test_city_formats_can_be_set_dynamically
    I18n.with_locale(:xx) do
      assert_equal "stoneledge", Faker::Address.city
    end
  end

  def test_secondary_address_is_both_numerified_and_letterified
    I18n.with_locale(:xx) do
      address = Faker::Address.secondary_address
      assert address =~ /Oppg\.\ [A-Z]\ Leil\.\ \d{2}/, "Unexpected format: #{address}"
    end
  end

  def test_street_name_supports_default_format
    I18n.with_locale(:xx) do
      street = Faker::Address.street_name
      expected = ['beth blvd', 'wainwright blvd']
      assert expected.include?(street), "Expected #{street} to be included in [#{expected.join(', ')}]"
    end
  end

  def test_street_name_formats_can_be_set_dynamically
    I18n.with_locale(:xy) do
      assert_equal "higate", Faker::Address.street_name
    end
  end

end
