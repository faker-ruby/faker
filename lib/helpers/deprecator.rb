# frozen_string_literal: true

# rubocop:disable Style/ClassVars
module Faker
  module Deprecator
    def self.included(base)
      extension = Module.new do
        def const_missing(missing_const_name)
          if class_variable_defined?(:@@_deprecated_constants) && (replacement = class_variable_get(:@@_deprecated_constants)[missing_const_name.to_s])
            return replacement[:new_constant]
          end

          super
        end

        def deprecate_generator(old_generator_name, new_generator_constant)
          class_variable_set(:@@_deprecated_constants, {}) unless class_variable_defined?(:@@_deprecated_constants)
          class_variable_get(:@@_deprecated_constants)[old_generator_name] = { new_constant: new_generator_constant }

          $stdout.puts("DEPRECATION WARNING: #{old_generator_name} is deprecated! Use #{new_generator_constant} instead.")
        end
      end

      base.singleton_class.prepend extension
    end
  end
end
# rubocop:enable Style/ClassVars
