# frozen_string_literal: true

module Faker
  class CryptoCoin < Base
    class << self
      COIN_NAME = 0
      ACRONYM = 1
      URL_LOGO = 2

      def coin_name(legacy_coin = NOT_GIVEN, coin: coin_array)
        warn_for_deprecated_arguments do |keywords|
          keywords << :coin if legacy_coin != NOT_GIVEN
        end

        coin[COIN_NAME]
      end

      def acronym(legacy_coin = NOT_GIVEN, coin: coin_array)
        warn_for_deprecated_arguments do |keywords|
          keywords << :coin if legacy_coin != NOT_GIVEN
        end

        coin[ACRONYM]
      end

      def url_logo(legacy_coin = NOT_GIVEN, coin: coin_array)
        warn_for_deprecated_arguments do |keywords|
          keywords << :coin if legacy_coin != NOT_GIVEN
        end

        coin[URL_LOGO]
      end

      def coin_array
        fetch('crypto_coin.coin').split(',').map(&:strip)
      end

      def coin_hash
        coin = coin_array

        {
          name: coin_name(coin: coin),
          acronym: acronym(coin: coin),
          url_logo: url_logo(coin: coin)
        }
      end
    end
  end
end
