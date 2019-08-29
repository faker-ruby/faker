# frozen_string_literal: true

module Faker
  class Types < Base
    CHARACTERS = ('0'..'9').to_a + ('a'..'z').to_a
    SIMPLE_TYPES = %i[string fixnum].freeze
    COMPLEX_TYPES = %i[hash array].freeze

    class << self
      def rb_string(legacy_words = NOT_GIVEN, words: 1)
        if legacy_words != NOT_GIVEN
          warn_with_uplevel 'Passing `words` with the 1st argument of `Types.rb_string` is deprecated. Use keyword argument like `Types.rb_string(words: ...)` instead.', uplevel: 1
          words = legacy_words
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
        if legacy_from != NOT_GIVEN
          warn_with_uplevel 'Passing `from` with the 1st argument of `Types.rb_integer` is deprecated. Use keyword argument like `Types.rb_integer(from: ...)` instead.', uplevel: 1
          from = legacy_from
        end
        if legacy_to != NOT_GIVEN
          warn_with_uplevel 'Passing `to` with the 2nd argument of `Types.rb_integer` is deprecated. Use keyword argument like `Types.rb_integer(to: ...)` instead.', uplevel: 1
          to = legacy_to
        end

        rand(from..to).to_i
      end

      def rb_hash(legacy_number = NOT_GIVEN, legacy_type = NOT_GIVEN, number: 1, type: random_type)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Types.rb_hash` is deprecated. Use keyword argument like `Types.rb_hash(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end
        if legacy_type != NOT_GIVEN
          warn_with_uplevel 'Passing `type` with the 2nd argument of `Types.rb_hash` is deprecated. Use keyword argument like `Types.rb_hash(type: ...)` instead.', uplevel: 1
          type = legacy_type
        end

        {}.tap do |hsh|
          Lorem.words(number: number * 2).uniq.first(number).each do |s|
            hsh.merge!(s.to_sym => type)
          end
        end
      end

      def complex_rb_hash(legacy_number = NOT_GIVEN, number: 1)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Types.complex_rb_hash` is deprecated. Use keyword argument like `Types.complex_rb_hash(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end

        rb_hash(number: number, type: random_complex_type)
      end

      def rb_array(legacy_len = NOT_GIVEN, len: 1)
        if legacy_len != NOT_GIVEN
          warn_with_uplevel 'Passing `len` with the 1st argument of `Types.rb_array` is deprecated. Use keyword argument like `Types.rb_array(len: ...)` instead.', uplevel: 1
          len = legacy_len
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
