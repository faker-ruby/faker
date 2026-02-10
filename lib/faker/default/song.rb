# frozen_string_literal: true

module Faker
  class Song < Base
    class << self
      NOTE_LETTERS = %w[C D E F G A B].freeze
      ACCIDENTAL_SIGNS = ['b', '#', ''].freeze
      KEY_TYPES = ['', 'm'].freeze
      CHORD_TYPES = ['', 'maj', '6', 'maj7', 'm', 'm7', '-7', '7', 'dom7', 'dim', 'dim7', 'm7b5'].freeze

      ##
      # Produces the name of a key/note, using letter notation.
      #
      # @return [String]
      #
      # @example
      #   Faker::Song.key #=> "A#"
      #
      # @faker.version 1.6.4
      def key
        sample(keys) + sample(key_variants)
      end

      ##
      # Produces the name of a chord, using letter notation.
      #
      # @return [String]
      #
      # @example
      #   Faker::Song.chord #=> "Adim7"
      #
      # @faker.version 1.6.4
      def chord
        key + sample(chord_types)
      end

      ##
      # Produces the name of an instrument.
      #
      # @return [String]
      #
      # @example
      #   Faker::Song.instrument #=> "Acoustic Guitar"
      #
      # @faker.version 1.6.4
      def instrument
        fetch('music.instruments')
      end

      ##
      # Produces an array of the letter names of musical notes, without accidentals.
      #
      # @return [Array<String>]
      #
      # @faker.version 1.6.4
      def keys
        NOTE_LETTERS
      end

      ##
      # Produces an array of accidentals (with "natural" denoted as an empty string).
      #
      # @return [Array<String>]
      #
      # @faker.version 1.6.4
      def key_variants
        ACCIDENTAL_SIGNS
      end

      ##
      # Produces an array of key types (with "major" denoted as an empty string).
      #
      # @return [Array<String>]
      #
      # @example
      #   Faker::Song.key_types #=> ['', 'm']
      #
      # @faker.version 1.6.4
      def key_types
        KEY_TYPES
      end

      ##
      # Produces an array of types of chords.
      #
      # @return [Array<String>]
      #
      # @faker.version 1.6.4
      def chord_types
        CHORD_TYPES
      end

      ##
      # Produces the name of a band.
      #
      # @return [String]
      #
      # @example
      #   Faker::Song.band #=> "The Beatles"
      #
      # @faker.version 1.9.1
      def band
        fetch('music.bands')
      end

      ##
      # Produces the name of an album.
      #
      # @return [String]
      #
      # @example
      #   Faker::Song.album #=> "Sgt. Pepper's Lonely Hearts Club"
      #
      # @faker.version 1.9.1
      def album
        fetch('music.albums')
      end

      ##
      # Produces the name of a musical genre.
      #
      # @return [String]
      #
      # @example
      #   Faker::Song.genre #=> "Rock"
      #
      # @faker.version 1.9.1
      def genre
        fetch('music.genres')
      end

      ##
      # Produces a name from Lou Bega's Mambo #5
      #
      # @return [String]
      #
      # @example
      #   Faker::Song.mambo #=> "Monica"
      # @faker.version next
      def mambo_no_5
        fetch('music.mambo_no_5')
      end
    end
  end
end
