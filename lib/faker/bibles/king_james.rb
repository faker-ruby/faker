# frozen_string_literal: true

module Faker
  class Bibles
    class KingJames < Base
      BOOKS = %w[genesis exodus leviticus numbers deuteronomy joshua judges ruth one_samuel two_samuel one_kings two_kings one_chronicles two_chronicles ezra nehemiah esther job psalms proverbs ecclesiastes song_of_solomon isaiah jeremiah lamentations ezekiel daniel hosea joel amos obadiah jonah micah nahum habakkuk zephaniah haggai zechariah malachi matthew mark luke john acts romans one_corinthians two_corinthians galatians ephesians philippians colossians one_thessalonians two_thessalonians one_timothy two_timothy titus philemon hebrews james one_peter two_peter one_john two_john three_john jude revelation].freeze
      PREFIX_PATTERN = /^[[:alnum:] ]+?\d+?:\d+? /.freeze

      flexible :king_james

      class << self
        ##
        # Produces the name of a random book from the bible
        #
        # @return [String]
        #
        # @example
        #   Faker::Bibles::KingJames.book #=> "genesis"
        #
        # @faker.version next
        def book
          BOOKS.sample
        end

        ##
        # Produces a random verse from the bible.
        #
        #
        # @param prefix [Boolean] If true, append the book and verse to the quote
        # @param emphasis [Boolean] If true, include "*" around emphasized words
        # @param books [String | Symbol | Array<String | Symbol>]
        #   A book, or list of books to generate a verse from.
        #   If you want a verse from a particular book, you can call `Faker::Bibles::KingJames.{book}` as well.
        #
        # @return [String]
        #
        # @example
        #   Faker::Bibles::KingJames.verse
        #   Faker::Bibles::KingJames.genesis
        #     #=> "Genesis 6:22 Thus did Noah; according to all that God commanded him, so did he."
        #
        #   Faker::Bibles::KingJames.verse(prefix: false)
        #   Faker::Bibles::KingJames.acts(prefix: false)
        #     #=> "But Solomon built him an house."
        #
        #   Faker::Bibles::KingJames.verse(emphasis: false)
        #   Faker::Bibles::KingJames.obadiah(emphasis: false)
        #     #=> "Obadiah 1:6 How are the things of Esau searched out! how are his hidden things sought up!"
        #
        #   Faker::Bibles::KingJames.verse(emphasis: true)
        #   Faker::Bibles::KingJames.obadiah(emphasis: true)
        #     #=> "Obadiah 1:6 How are *the things* of Esau searched out! *how* are his hidden things sought up!"
        #
        # @faker.version next
        def verse(prefix: true, emphasis: false, books: BOOKS)
          books = [books] unless books.is_a? Array
          validate_book_names(books)
          format(fetch("king_james.#{books.sample}"), prefix, emphasis)
        end

        BOOKS.each do |book|
          define_method(:"#{book}") do |prefix: true, emphasis: false|
            verse(prefix: prefix, emphasis: emphasis, books: book)
          end
        end

        private

        def invalid_book_names?(arr)
          (arr & BOOKS).size < arr.size
        end

        def validate_book_names(arr)
          raise ArgumentError, "Given book names: #{arr.join(', ')}. Valid: #{BOOKS.join(', ')}" if invalid_book_names?(arr)
        end

        def format(string, prefix, emphasis)
          string.gsub!(PREFIX_PATTERN, '') unless prefix
          string.delete!('*') unless emphasis
          string
        end
      end
    end
  end
end
