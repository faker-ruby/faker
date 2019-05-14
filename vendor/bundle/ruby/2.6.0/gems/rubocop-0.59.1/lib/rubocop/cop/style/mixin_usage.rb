# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # This cop checks that `include`, `extend` and `prepend` statements appear
      # inside classes and modules, not at the top level, so as to not affect
      # the behavior of `Object`.
      #
      # @example
      #   # bad
      #   include M
      #
      #   class C
      #   end
      #
      #   # bad
      #   extend M
      #
      #   class C
      #   end
      #
      #   # bad
      #   prepend M
      #
      #   class C
      #   end
      #
      #   # good
      #   class C
      #     include M
      #   end
      #
      #   # good
      #   class C
      #     extend M
      #   end
      #
      #   # good
      #   class C
      #     prepend M
      #   end
      class MixinUsage < Cop
        MSG = '`%<statement>s` is used at the top level. Use inside `class` ' \
              'or `module`.'.freeze

        def_node_matcher :include_statement, <<-PATTERN
          (send nil? ${:include :extend :prepend}
            const)
        PATTERN

        def on_send(node)
          include_statement(node) do |statement|
            return if node.argument? ||
                      accepted_include?(node) ||
                      belongs_to_class_or_module?(node)

            add_offense(node, message: format(MSG, statement: statement))
          end
        end

        private

        def accepted_include?(node)
          node.parent && node.macro?
        end

        def belongs_to_class_or_module?(node)
          if !node.parent
            false
          else
            return true if node.parent.class_type? || node.parent.module_type?

            belongs_to_class_or_module?(node.parent)
          end
        end
      end
    end
  end
end
