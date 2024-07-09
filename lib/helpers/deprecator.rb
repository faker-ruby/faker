# frozen_string_literal: true

# Based on Rails ActiveSupport Deprecator
# https://github.com/rails/rails/blob/6f0d1ad14b92b9f5906e44740fce8b4f1c7075dc/activesupport/lib/active_support/deprecation/constant_accessor.rb

# rubocop:disable Style/ClassVars
module Faker
  module Deprecator
    def self.included(base)
      extension = Module.new do
        def const_missing(missing_const_name)
          if class_variable_defined?(:@@_deprecated_constants) && (replacement = class_variable_get(:@@_deprecated_constants)[missing_const_name.to_s])
            unless Faker::Deprecator.skip_warning?
              $stdout.puts("DEPRECATION WARNING: #{name}::#{replacement[:old_generator]} is deprecated. Use #{replacement[:new_constant]} instead.")
            end

            return replacement[:new_constant]
          end

          super
        end

        def deprecate_generator(old_generator_name, new_generator_constant)
          class_variable_set(:@@_deprecated_constants, {}) unless class_variable_defined?(:@@_deprecated_constants)
          class_variable_get(:@@_deprecated_constants)[old_generator_name] = { new_constant: new_generator_constant, old_generator: old_generator_name }
        end
      end

      base.singleton_class.prepend extension
    end

    def self.skip_warning
      original = Faker::Deprecator.skip
      Faker::Deprecator.skip = true
      yield
    ensure
      Faker::Deprecator.skip = original
    end

    def self.skip_warning?
      skip == true
    end

    def self.skip
      @skip ||= false
    end

    def self.skip=(value)
      @skip = value
    end
  end
end
# rubocop:enable Style/ClassVars
