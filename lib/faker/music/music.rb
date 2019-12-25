# frozen_string_literal: true

module Faker
  class Music < Base
    class << self
      ##
      # Produces the name of a key/note, using letter notation.
      #
      # @return [String]
      #
      # @example
      #   Faker::Music.key #=> "A#"
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
      #   Faker::Music.chord #=> "Adim7"
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
      #   Faker::Music.instrument #=> "Acoustic Guitar"
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
        %w[C D E F G A B]
      end

      ##
      # Produces an array of accidentals (with "natural" denoted as an empty string).
      #
      # @return [Array<String>]
      #
      # @faker.version 1.6.4
      def key_variants
        ['b', '#', '']
      end

      ##
      # Produces an array of key types (with "major" denoted as an empty string).
      #
      # @return [Array<String>]
      #
      # @example
      #   Faker::Music.key_types #=> ['', 'm']
      #
      # @faker.version 1.6.4
      def key_types
        ['', 'm']
      end

      ##
      # Produces an array of types of chords.
      #
      # @return [Array<String>]
      #
      # @faker.version 1.6.4
      def chord_types
        ['', 'maj', '6', 'maj7', 'm', 'm7', '-7', '7', 'dom7', 'dim', 'dim7', 'm7b5']
      end

      ##
      # Produces the name of a band.
      #
      # @return [String]
      #
      # @example
      #   Faker::Music.band #=> "The Beatles"
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
      #   Faker::Music.album #=> "Sgt. Pepper's Lonely Hearts Club"
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
      #   Faker::Music.genre #=> "Rock"
      #
      # @faker.version 1.9.1
      def genre
        fetch('music.genres')
      end
    end
  end
end
