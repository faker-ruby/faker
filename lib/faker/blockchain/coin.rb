# frozen_string_literal: true

module Faker
  class Blockchain
    class Coin < Base
      class << self
        extend Gem::Deprecate

        ::NAME = 0
        ::ACRONYM = 1
        ::URL_LOGO = 2

        ##
        # [Deprecated] Produces a random blockchain coin name.
        #
        # @return [String]
        #
        # @example
        #   Faker::Blockchain::Coin.coin_name #=> "Bitcoin"
        #
        # @faker.version 1.9.2
        def coin_name
          coin[NAME]
        end
        deprecate :coin_name, :name, 2025, 4

        ##
        # Produces a random Blockchain coin name.
        #
        # @return [String]
        #
        # @example
        #   Faker::Blockchain::Coin.name #=> "Bitcoin"
        #
        def name
          coin[NAME]
        end

        ##
        # Produces a random blockchain coin acronym.
        #
        # @return [String]
        #
        # @example
        #   Faker::Blockchain::Coin.acronym #=> "BTC"
        #
        # @faker.version 1.9.2
        def acronym
          coin[ACRONYM]
        end

        ##
        # Produces a random blockchain coin logo url.
        #
        # @return [String]
        #
        # @example
        #   Faker::Blockchain::Coin.url_logo #=> "https://i.imgur.com/EFz61Ei.png"
        #
        # @faker.version 1.9.2
        def url_logo
          coin[URL_LOGO]
        end

        ##
        # Produces a random blockchain coin's name, acronym and logo in an array.
        # Valid arguments are "array" and "hash".
        # Raises ArgumentError on invalid arguments.
        #
        # @return [Array<String>]
        #
        # @example
        #   Faker::Blockchain::Coin.coin_array #=> ["Dash", "DASH", "https://i.imgur.com/2uX91cb.png"]
        #
        # @faker.version 1.9.2
        def metadata(format: "array")
          # return ArgumentError if invalid param

          if format == "array" # or should this be a symbol?
            fetch('blockchain.coin').split(',').map(&:strip)
          else
            build_hash
          end
        end

        ##
        # [Deprecated] Produces a random blockchain coin's name, acronym and logo in a hash.
        #
        # @return [Hash]
        #
        # @example
        #   Faker::Blockchain::Coin.coin_hash {:name=>"Ethereum", :acronym=>"ETH", :url_logo=>"https://i.imgur.com/uOPFCXj.png"}
        #
        # @faker.version 1.9.2
        def coin_hash
          {
            name: name,
            acronym: acronym,
            url_logo: url_logo
          }
        end
        deprecate :coin_hash, :metadata, 2025, 4

        ##
        # [Deprecated] Produces a random crypto coin's name, acronym and logo in an array.
        #
        # @return [Array<String>]
        #
        # @example
        #   Faker::Blockchain::Coin.coin_array #=> ["Dash", "DASH", "https://i.imgur.com/2uX91cb.png"]
        #
        # @faker.version 1.9.2
        def coin_array
          fetch('blockchain.coin').split(',').map(&:strip)
        end
        deprecate :coin_array, :metadata, 2025, 4

        private

        # can't actually do this lol we get the same name all the time
        # or can we?
        def coin(format: "array")
          @coin ||= metadata(format:)
        end

        def build_hash
          {
            name: name,
            acronym: acronym,
            url_logo: url_logo
          }
        end
      end
    end
  end

  include Faker::Deprecator
  deprecate_generator('CryptoCoin', Blockchain::Coin)
end
