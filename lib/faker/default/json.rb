module Faker
  class Json < Base
    require 'json'

    class << self
      def shallow_json(legacy_width = NOT_GIVEN, legacy_options = NOT_GIVEN, width: 3, options: { key: 'Name.first_name', value: 'Name.first_name' })
        warn_for_deprecated_arguments do |keywords|
          keywords << :width if legacy_width != NOT_GIVEN
          keywords << :options if legacy_options != NOT_GIVEN
        end

        options[:key] = 'Faker::' + options[:key]
        options[:value] = 'Faker::' + options[:value]

        hash = build_shallow_hash(width, options)
        JSON.generate(hash)
      end

      # rubocop:disable Metrics/ParameterLists
      def add_depth_to_json(legacy_json = NOT_GIVEN, legacy_width = NOT_GIVEN, legacy_options = NOT_GIVEN, json: shallow_json, width: 3, options: { key: 'Name.first_name', value: 'Name.first_name' })
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :json if legacy_json != NOT_GIVEN
        end
        warn_for_deprecated_arguments do |keywords|
          keywords << :width if legacy_width != NOT_GIVEN
        end
        warn_for_deprecated_arguments do |keywords|
          keywords << :options if legacy_options != NOT_GIVEN
        end

        options[:key] = 'Faker::' + options[:key]
        options[:value] = 'Faker::' + options[:value]

        hash = JSON.parse(json)
        hash.each do |key, _|
          add_hash_to_bottom(hash, [key], width, options)
        end
        JSON.generate(hash)
      end

      private

      def build_shallow_hash(width, options)
        key = options[:key]
        value = options[:value]

        hash = {}
        width.times do
          hash[eval(key)] = eval(value)
        end
        hash
      end

      def add_hash_to_bottom(hash, key_array, width, options)
        key_string = build_keys_from_array(key_array)
        if eval("hash#{key_string}").is_a?(::Hash)
          eval("hash#{key_string}").each do |key, _|
            key_array << key
            add_hash_to_bottom(hash, key_array, width, options)
          end
        else
          add_hash(key_array, hash, width, options)
          key_array.pop
        end
      end

      def add_hash(key_array, hash, width, options)
        string_to_eval = 'hash'
        key_array.length.times do |index|
          string_to_eval << "['#{key_array[index]}']"
        end
        string_to_eval << " = #{build_shallow_hash(width, options)}"
        eval(string_to_eval)
        hash
      end

      def build_keys_from_array(key_array)
        key_string = ''
        key_array.each do |value|
          key_string << "['#{value}']"
        end
        key_string
      end
    end
  end
end
