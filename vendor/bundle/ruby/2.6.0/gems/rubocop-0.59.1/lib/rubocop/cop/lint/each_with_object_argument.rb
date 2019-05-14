# frozen_string_literal: true

module RuboCop
  module Cop
    module Lint
      # This cop checks if each_with_object is called with an immutable
      # argument. Since the argument is the object that the given block shall
      # make calls on to build something based on the enumerable that
      # each_with_object iterates over, an immutable argument makes no sense.
      # It's definitely a bug.
      #
      # @example
      #
      #   # bad
      #
      #   sum = numbers.each_with_object(0) { |e, a| a += e }
      #
      # @example
      #
      #   # good
      #
      #   num = 0
      #   sum = numbers.each_with_object(num) { |e, a| a += e }
      class EachWithObjectArgument < Cop
        MSG = 'The argument to each_with_object can not be immutable.'.freeze

        def_node_matcher :each_with_object?, '(send _ :each_with_object $_)'

        def on_send(node)
          each_with_object?(node) do |arg|
            return unless arg.immutable_literal?

            add_offense(node)
          end
        end
      end
    end
  end
end
