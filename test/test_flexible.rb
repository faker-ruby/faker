# frozen_string_literal: true

require_relative 'test_helper'

module Faker
  class Foodie < Base
    flexible :chow
  end
end

class TestFlexible < Test::Unit::TestCase
  def setup
    @old_locales = I18n.config.available_locales
    I18n.config.available_locales += %i[xx home kindergarden work]
    I18n.backend.store_translations(:xx, faker: { chow: { yummie: %i[fudge chocolate caramel], taste: 'delicious' } })
    I18n.backend.store_translations(:home, faker: { address: { birthplace: %i[bed hospital airplane] } })
    I18n.backend.store_translations(:kindergarden, faker: { name: { girls_name: %i[alice cheryl tatiana] } })
    I18n.backend.store_translations(:work, faker: { company: { do_stuff: %i[work work work] } })
  end

  def teardown
    I18n.config.available_locales = @old_locales
  end

  def test_flexible_multiple_values
    I18n.with_locale(:xx) do
      assert_includes %i[fudge chocolate caramel], Faker::Foodie.yummie
    end
  end

  def test_flexible_single_value
    I18n.with_locale(:xx) do
      assert_equal 'delicious', Faker::Foodie.taste
    end
  end

  def test_flexible_fallbacks_to_english
    I18n.backend.store_translations(:en, faker: { chow: { taste: 'superdelicious' } })

    I18n.with_locale(:home) do
      assert_equal 'superdelicious', Faker::Foodie.taste
    end

    I18n.reload!
  end

  def test_raises_missing_translation_data_when_not_even_english_defined
    I18n.with_locale(:xx) do
      assert_raise(I18n::MissingTranslationData) do
        Faker::Foodie.eeew
      end
    end
  end

  def test_address_is_flexible
    I18n.with_locale(:home) do
      assert_includes %i[bed hospital airplane], Faker::Address.birthplace
    end
  end

  def test_name_is_flexible
    I18n.with_locale(:kindergarden) do
      assert_includes %i[alice cheryl tatiana], Faker::Name.girls_name
    end
  end

  def test_company_is_flexible
    I18n.with_locale(:work) do
      assert_equal(:work, Faker::Company.do_stuff)
    end
  end
end
