# frozen_string_literal: true

module Faker
  class Deprecator
    module DeprecatorConstantAccessor
      def self.included(base)
        puts base.singleton_class
        extension = Module.new do
          def const_missing(missing_const_name)
            puts "finding missing_const_name: ", missing_const_name.to_s
            if class_variable_defined?(:@@_deprecated_constants)
              if (replacement = class_variable_get(:@@_deprecated_constants)[missing_const_name.to_s])
                replacement[:deprecator].warn(replacement[:message] || "#{name}::#{missing_const_name} is deprecated! Use #{replacement[:new]} instead.", caller_locations)
                return Faker::IdNumber
              end
            end
            super
          end

          def deprecated_constant(const_name, new_constant, message: nil, deprecator: nil)
            puts("Constant being deprecated: ", const_name, '\nconstant replaceing:',new_constant )
            class_variable_set(:@@_deprecated_constants, {}) unless class_variable_defined?(:@@_deprecated_constants)
            class_variable_get(:@@_deprecated_constants)[const_name.to_s] = { new: new_constant, message: message, deprecator: deprecator }
          end
        end

        base.singleton_class.prepend extension
        puts base.ancestors
      end
    end
  end
end
