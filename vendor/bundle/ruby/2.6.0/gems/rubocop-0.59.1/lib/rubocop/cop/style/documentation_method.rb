# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # This cop checks for missing documentation comment for public methods.
      # It can optionally be configured to also require documentation for
      # non-public methods.
      #
      # @example
      #
      #   # bad
      #
      #   class Foo
      #     def bar
      #       puts baz
      #     end
      #   end
      #
      #   module Foo
      #     def bar
      #       puts baz
      #     end
      #   end
      #
      #   def foo.bar
      #     puts baz
      #   end
      #
      #   # good
      #
      #   class Foo
      #     # Documentation
      #     def bar
      #       puts baz
      #     end
      #   end
      #
      #   module Foo
      #     # Documentation
      #     def bar
      #       puts baz
      #     end
      #   end
      #
      #   # Documentation
      #   def foo.bar
      #     puts baz
      #   end
      class DocumentationMethod < Cop
        include DocumentationComment
        include DefNode

        MSG = 'Missing method documentation comment.'.freeze

        def on_def(node)
          check(node)
        end
        alias on_defs on_def

        private

        def check(node)
          return if non_public?(node) && !require_for_non_public_methods?
          return if documentation_comment?(node)

          add_offense(node)
        end

        def require_for_non_public_methods?
          cop_config['RequireForNonPublicMethods']
        end
      end
    end
  end
end
