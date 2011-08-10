require File.dirname(__FILE__) + '/test_helper.rb'

class TestAddress < Test::Unit::TestCase

  def setup
    xx = {
      :faker => {
        :address => {
          :city_root => ['Stone'],
          :city_suffix => ['ledge'],
          :city_formats => [[:city_root, :city_suffix]],
          :secondary_address => ['##?'],
          :street_suffix => ['Blvd'],
          :building_number => ["#"],
          :postcode => ["####"],
          :state => ['empire'],
          :default_country => ['Xu']
        },
        :name => {:first_name => ['Beth'], :last_name => ['Wainwright']}
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
          :building_number => ["##"],
          :secondary_address => ["Apt. ###"]
        },
        :name => {:first_name => [:thomas], :last_name => [:andersen]}
      }
    }
    xz = {
      :faker => {
        :address => {
          :building_number => ["##"],
          :street_root => [:low],
          :street_suffix => [:street],
          :street_joiner => " | ",
          :secondary_address => ['Apt. ###'],
          :street_name_formats => [[:street_root, :street_suffix]],
          :factorial => '!',
          :whitespace => ' ',
          :street_address_formats => [[:street_name, :whitespace, :building_number, :factorial]]
        }
      }
    }

    I18n.backend.store_translations(:xx, xx)
    I18n.backend.store_translations(:xy, xy)
    I18n.backend.store_translations(:xz, xz)
  end

  def test_city_root_with_translation
    I18n.with_locale(:xx) do
      assert_equal 'Stone', Faker::Address.city_root
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
      assert_equal "Stoneledge", Faker::Address.city
    end
  end

  def test_secondary_address_is_both_numerified_and_letterified
    I18n.with_locale(:xx) do
      address = Faker::Address.secondary_address
      assert address =~ /^\d{2}[A-Z]$/, "Unexpected format: #{address}"
    end
  end

  def test_street_name_supports_default_format
    I18n.with_locale(:xx) do
      street = Faker::Address.street_name
      expected = ['Beth Blvd', 'Wainwright Blvd']
      assert expected.include?(street), "Expected #{street} to be included in [#{expected.join(', ')}]"
    end
  end

  def test_street_name_formats_can_be_set_dynamically
    I18n.with_locale(:xy) do
      assert_equal "higate", Faker::Address.street_name
    end
  end

  def test_street_address_supports_default_format
    I18n.with_locale(:xy) do
      street = Faker::Address.street_address
      assert street =~ /^\d{2}\ higate$/, "Expected '#{street}' to match '<building_number> <street_name>'"
    end
  end

  def test_street_address_supports_default_format_with_secondary
    I18n.with_locale(:xy) do
      street = Faker::Address.street_address(:include_secondary)
      assert street =~ /^\d{2}\ higate\ Apt\.\ \d{3}$/, "Expected '#{street}' to match '<building_number> <street_name> Apt. <apartment_number>'"
    end
  end

  def test_street_address_can_override_default_format
    I18n.with_locale(:xz) do
      street = Faker::Address.street_address
      assert street =~ /^lowstreet \d{2}!$/, "Expected '#{street}' to match '<street_name> <building_number>!'"
    end
  end

  def test_street_address_can_override_default_format_with_secondary
      I18n.with_locale(:xz) do
      street = Faker::Address.street_address(:include_secondary)
      assert street =~ /^lowstreet\ \d{2}!\ \|\ Apt\.\ \d{3}$/, "Expected '#{street}' to match '<street_name> <building_number>! | Apt. <apartment_number>'"
    end
  end

  def test_create_an_address_for_a_given_locale
    address = Faker::Address.in(:"xx")
    street_regex = /^\d\ (Beth|Wainwright)\ Blvd(\ \d{2}[A-Z])?$/
    assert address.street_address.match(street_regex), "unexpected street_address: #{address.street_address}"
    assert_equal address.city, "Stoneledge"
    assert address.postcode.match(/^\d{4}$/), "unexpected postcode: #{address.postcode}"
    assert_equal address.state, "empire"
    assert_equal address.country, "Xu"
  end

  def test_get_an_address_for_the_current_locale
    address = Faker::Address.address
    assert_equal address.country, "United States of America"
  end

end
