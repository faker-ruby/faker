# frozen_string_literal: true

module RuboCop
  module Cop
    module Performance
      # Do not compute the size of statically sized objects.
      #
      # @example
      #   # String methods
      #   # bad
      #   'foo'.size
      #   %q[bar].count
      #   %(qux).length
      #
      #   # Symbol methods
      #   # bad
      #   :fred.size
      #   :'baz'.length
      #
      #   # Array methods
      #   # bad
      #   [1, 2, thud].count
      #   %W(1, 2, bar).size
      #
      #   # Hash methods
      #   # bad
      #   { a: corge, b: grault }.length
      #
      #   # good
      #   foo.size
      #   bar.count
      #   qux.length
      #
      #   # good
      #   :"#{fred}".size
      #   CONST = :baz.length
      #
      #   # good
      #   [1, 2, *thud].count
      #   garply = [1, 2, 3]
      #   garly.size
      #
      #   # good
      #   { a: corge, **grault }.length
      #   waldo = { a: corge, b: grault }
      #   waldo.size
      #
      class FixedSize < Cop
        MSG = 'Do not compute the size of statically sized objects.'.freeze

        def_node_matcher :counter, <<-MATCHER
          (send ${array hash str sym} {:count :length :size} $...)
        MATCHER

        def on_send(node)
          return if allowed_parent?(node.parent)

          counter(node) do |var, arg|
            return if allowed_variable?(var) || allowed_argument?(arg)

            add_offense(node)
          end
        end

        private

        def allowed_variable?(var)
          contains_splat?(var) || contains_double_splat?(var)
        end

        def allowed_argument?(arg)
          arg && non_string_argument?(arg.first)
        end

        def allowed_parent?(node)
          node && (node.casgn_type? || node.block_type?)
        end

        def contains_splat?(node)
          return unless node.array_type?

          node.each_child_node(:splat).any?
        end

        def contains_double_splat?(node)
          return unless node.hash_type?

          node.each_child_node(:kwsplat).any?
        end

        def non_string_argument?(node)
          node && !node.str_type?
        end
      end
    end
  end
end
