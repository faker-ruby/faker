# frozen_string_literal: true

module Faker
  class CryptoCoin < Base
    class << self
      COIN_NAME = 0
      ACRONYM = 1
      URL_LOGO = 2

      def coin_name(coin = coin_array)
        coin[COIN_NAME]
      end

      def acronym(coin = coin_array)
        coin[ACRONYM]
      end

      def url_logo(coin = coin_array)
        coin[URL_LOGO]
      end

      def coin_array
        fetch('crypto_coin.coin').split(',').map(&:strip)
      end

      def coin_hash
        coin = coin_array
        { name: coin_name(coin), acronym: acronym(coin), url_logo: url_logo(coin) }
      end
    end
  end
end
