require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerStreet < Test::Unit::TestCase
  def setup
    @tester = Faker::Address
    @old_locales = I18n.config.available_locales
    # rubocop:disable Lint/InterpolationCheck
    shire = {
      faker: {
        address: {
          street_name: ['#{street_prefix} #{street_root} #{street_suffix}'],
          street_prefix: ['Wide'],
          street_root: ['Cheerful'],
          street_suffix: ['Path'],
          secondary_address: ['(Green Door)'],
          street_address: ['#{street_name} #{building_number}'],
          building_number: ['#'],
          community_prefix: ['Pine'],
          community_suffix: ['Place'],
          time_zone: ['Pacific/Pago_Pago']
        }
      }
    }
    # rubocop:enable Lint/InterpolationCheck
    I18n.config.available_locales += [:shire]
    I18n.backend.store_translations(:shire, shire)
  end

  def teardown
    I18n.config.available_locales = @old_locales
  end

  def test_street_name_supports_flexible_formats
    I18n.with_locale(:shire) do
      assert_equal 'Wide Cheerful Path', @tester.street_name
    end
  end

  def test_street_address_supports_flexible_formats
    I18n.with_locale(:shire) do
      assert_match(/Wide Cheerful Path \d/, @tester.street_address)
    end
  end

  def test_community_supports_flexible_formats
    I18n.with_locale(:shire) do
      assert_match(/Pine Place/, @tester.community)
    end
  end

  def test_street_address_optionally_provides_secondary_address
    I18n.with_locale(:shire) do
      assert_match(/Wide Cheerful Path \d \(Green Door\)/, @tester.street_address(:include_secondary))
    end
  end

  def test_street_address_with_locale_fallback
    I18n.with_locale('en-GB') do
      assert_match(/^\d+ [\w']+ \w+/, @tester.street_address)
    end
  end

  def test_timezone_support
    I18n.with_locale(:shire) do
      assert_equal 'Pacific/Pago_Pago', @tester.time_zone
    end
  end

  def test_full_address
    I18n.with_locale('en') do
      assert_match(/^(.+\s)?\d+ [\w'\s]+\, [\w'\s]+\, [\w']+ \d+/, @tester.full_address)
    end
  end
end
