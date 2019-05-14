# frozen_string_literal: true

module RuboCop
  module Cop
    # Shared functionality between mixins that enforce naming conventions
    module ConfigurableFormatting
      include ConfigurableEnforcedStyle

      def check_name(node, name, name_range)
        return if operator?(name)

        if valid_name?(node, name)
          correct_style_detected
        else
          add_offense(node, location: name_range, message: message(style)) do
            report_opposing_styles(node, name)
          end
        end
      end

      def report_opposing_styles(node, name)
        alternative_styles.each do |alternative|
          if valid_name?(node, name, alternative)
            return unexpected_style_detected(alternative)
          end
        end
      end

      def valid_name?(node, name, given_style = style)
        name.match(self.class::FORMATS.fetch(given_style)) ||
          class_emitter_method?(node, name)
      end

      # A class emitter method is a singleton method in a class/module, where
      # the method has the same name as a class defined in the class/module.
      def class_emitter_method?(node, name)
        return false unless node.parent && node.defs_type?

        # a class emitter method may be defined inside `def self.included`,
        # `def self.extended`, etc.
        node = node.parent while node.parent.defs_type?

        node.parent.each_child_node(:class).any? do |c|
          c.loc.name.is?(name.to_s)
        end
      end
    end
  end
end
