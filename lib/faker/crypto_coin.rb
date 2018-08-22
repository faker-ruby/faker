# frozen_string_literal: true

module Faker
  class CryptoCoin < Base
    class << self
      COIN_NAME = 0
      ACRONYM = 1
      URL_LOGO = 2

      def coin_name
        coin[COIN_NAME]
      end

      def acronym
        coin[ACRONYM]
      end

      def url_logo
        coin[URL_LOGO]
      end

      def coin
        parse('crypto_coin.coin').split(',').map(&:strip)
      end

      def coin_hash
        { name: coin_name, acronym: acronym, url_logo: url_logo }
      end
    end
  end
end
