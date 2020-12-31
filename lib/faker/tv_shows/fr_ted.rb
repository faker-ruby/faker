# frozen_string_literal: true

module Faker
  class TvShows
    class FrTed < Base
      flexible :fr_ted

      class << self
        ##
        # Produces a character from Fr Ted
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::FrTed.character # => "Henry Sellers"
        #
        # @faker.version next
        def character
          fetch('fr_ted.characters')
        end

        ##
        # Produces a quote from Fr Ted that is up to 255 characters long.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::FrTed.quote #=> "Honestly, Dougal, could you not knock the old rollerblading on the head for a couple of weeks?"
        #
        # @faker.version next
        def quote
          fetch('fr_ted.quotes')
        end

        ##
        # Produces a quote from Fr Ted that is at most 30 characters long.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::FrTed.short_quote #=> "Ted! You forgot your brick!"
        #
        # @faker.version next
        def short_quote
          fetch('fr_ted.short_quotes')
        end

        ##
        # Produces a quote from Fr Ted that is at least 256 characters long.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::FrTed.long_quote #=> "Because of the beast. They say it's as big as four cats and it's got a retractable leg so's it can leap up at you better. And you know what, Ted, it lights up at night and it's got four ears, two of them are for listening and the other two are kind of back-up ears. Its claws are as big as cups and for some reason, it's got a tremendous fear of stamps! Mrs Doyle was telling me that it's got magnets on its tail, so's if you're made out of metal it can attach itself to you and instead of a mouth, it's got four arses!"
        #
        # @faker.version next
        def long_quote
          fetch('fr_ted.long_quotes')
        end
      end
    end
  end
end
