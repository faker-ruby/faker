# frozen_string_literal: true

module Faker
  class Types < Base
    CHARACTERS = ('0'..'9').to_a + ('a'..'z').to_a
    SIMPLE_TYPES = %i[string fixnum].freeze
    COMPLEX_TYPES = %i[hash array].freeze

    class << self
      def rb_string(legacy_words = NOT_GIVEN, words: 1)
        warn_for_deprecated_arguments do |keywords|
          keywords << :words if legacy_words != NOT_GIVEN
        end

        resolved_num = resolve(words)
        word_list =
          translate('faker.lorem.words')

        word_list *= ((resolved_num / word_list.length) + 1)
        shuffle(word_list)[0, resolved_num].join(' ')
      end

      def character
        sample(CHARACTERS)
      end

      def rb_integer(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from: 0, to: 100)
        warn_for_deprecated_arguments do |keywords|
          keywords << :from if legacy_from != NOT_GIVEN
          keywords << :to if legacy_to != NOT_GIVEN
        end

        rand(from..to).to_i
      end

      def rb_hash(legacy_number = NOT_GIVEN, legacy_type = NOT_GIVEN, number: 1, type: random_type)
        warn_for_deprecated_arguments do |keywords|
          keywords << :number if legacy_number != NOT_GIVEN
          keywords << :type if legacy_type != NOT_GIVEN
        end

        {}.tap do |hsh|
          Lorem.words(number: number * 2).uniq.first(number).each do |s|
            hsh.merge!(s.to_sym => type)
          end
        end
      end

      def complex_rb_hash(legacy_number = NOT_GIVEN, number: 1)
        warn_for_deprecated_arguments do |keywords|
          keywords << :number if legacy_number != NOT_GIVEN
        end

        rb_hash(number: number, type: random_complex_type)
      end

      def rb_array(legacy_len = NOT_GIVEN, len: 1)
        warn_for_deprecated_arguments do |keywords|
          keywords << :len if legacy_len != NOT_GIVEN
        end

        [].tap do |ar|
          len.times do
            ar.push random_type
          end
        end
      end

      def random_type
        type_to_use = SIMPLE_TYPES[rand(0..SIMPLE_TYPES.length - 1)]
        case type_to_use
        when :string
          rb_string
        when :fixnum
          rb_integer
        end
      end

      def random_complex_type
        types = SIMPLE_TYPES + COMPLEX_TYPES
        type_to_use = types[rand(0..types.length - 1)]
        case type_to_use
        when :string
          rb_string
        when :fixnum
          rb_integer
        when :hash
          rb_hash
        when :array
          rb_array
        end
      end

      private

      def titleize(word)
        word.split(/(\W)/).map(&:capitalize).join
      end
    end
  end
end
