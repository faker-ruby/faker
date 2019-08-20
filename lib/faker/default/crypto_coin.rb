# frozen_string_literal: true

module Faker
  class CryptoCoin < Base
    class << self
      COIN_NAME = 0
      ACRONYM = 1
      URL_LOGO = 2

      def coin_name(legacy_coin = NOT_GIVEN, coin: coin_array)
        if legacy_coin != NOT_GIVEN
          warn_with_uplevel 'Passing `coin` with the 1st argument of `CryptoCoin.coin_name` is deprecated. Use keyword argument like `CryptoCoin.coin_name(coin: ...)` instead.', uplevel: 1
          coin = legacy_coin
        end

        coin[COIN_NAME]
      end

      def acronym(legacy_coin = NOT_GIVEN, coin: coin_array)
        if legacy_coin != NOT_GIVEN
          warn_with_uplevel 'Passing `coin` with the 1st argument of `CryptoCoin.acronym` is deprecated. Use keyword argument like `CryptoCoin.acronym(coin: ...)` instead.', uplevel: 1
          coin = legacy_coin
        end

        coin[ACRONYM]
      end

      def url_logo(legacy_coin = NOT_GIVEN, coin: coin_array)
        if legacy_coin != NOT_GIVEN
          warn_with_uplevel 'Passing `coin` with the 1st argument of `CryptoCoin.url_logo` is deprecated. Use keyword argument like `CryptoCoin.url_logo(coin: ...)` instead.', uplevel: 1
          coin = legacy_coin
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
