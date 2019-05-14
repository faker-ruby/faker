# frozen_string_literal: true

module RuboCop
  module Cop
    module Lint
      # This cop checks for empty `ensure` blocks
      #
      # @example
      #
      #   # bad
      #
      #   def some_method
      #     do_something
      #   ensure
      #   end
      #
      # @example
      #
      #   # bad
      #
      #   begin
      #     do_something
      #   ensure
      #   end
      #
      # @example
      #
      #   # good
      #
      #   def some_method
      #     do_something
      #   ensure
      #     do_something_else
      #   end
      #
      # @example
      #
      #   # good
      #
      #   begin
      #     do_something
      #   ensure
      #     do_something_else
      #   end
      class EmptyEnsure < Cop
        MSG = 'Empty `ensure` block detected.'.freeze

        def on_ensure(node)
          add_offense(node, location: :keyword) unless node.body
        end

        def autocorrect(node)
          lambda do |corrector|
            corrector.remove(node.loc.keyword)
          end
        end
      end
    end
  end
end
