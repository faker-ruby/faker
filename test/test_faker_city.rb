# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerCity < Test::Unit::TestCase
  def setup
    @old_locales = I18n.config.available_locales
    xx = {
      faker: {
        name: { female_first_name: ['alice'], male_first_name: ['alice'], last_name: ['smith'] },
        address: { city_prefix: ['west'], city_suffix: ['burg'] }
      }
    }
    I18n.config.available_locales += [:xx]
    I18n.backend.store_translations(:xx, xx)

    # rubocop:disable Lint/InterpolationCheck
    xy = {
      faker: {
        address: {
          city_prefix: ['big'],
          city_root: ['rock'],
          city_root_suffix: ['ing'],
          city_suffix: ['town'],
          city: ['#{city_prefix} #{city_root}#{city_root_suffix} #{city_suffix}']
        }
      }
    }
    # rubocop:enable Lint/InterpolationCheck
    I18n.config.available_locales += [:xy]
    I18n.backend.store_translations(:xy, xy)
  end

  def teardown
    I18n.config.available_locales = @old_locales
  end

  def test_default_city_formats
    I18n.with_locale(:xx) do
      100.times do
        cities = ['west alice', 'west smith', 'west aliceburg', 'west smithburg', 'aliceburg', 'smithburg']
        city = Faker::Address.city
        assert cities.include?(city), "Expected <#{cities.join(' / ')}>, but got #{city}"
      end
    end
  end

  def test_city_formats_are_flexible
    I18n.with_locale(:xy) do
      cities = ['big rocking town']
      city = Faker::Address.city
      assert cities.include?(city), "Expected <#{cities.join(' / ')}>, but got #{city}"
    end
  end
end
