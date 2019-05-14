# frozen_string_literal: true

module RuboCop
  module Cop
    module Rails
      # This cop checks for scope calls where it was passed
      # a method (usually a scope) instead of a lambda/proc.
      #
      # @example
      #
      #   # bad
      #   scope :something, where(something: true)
      #
      #   # good
      #   scope :something, -> { where(something: true) }
      class ScopeArgs < Cop
        MSG = 'Use `lambda`/`proc` instead of a plain method call.'.freeze

        def_node_matcher :scope?, '(send nil? :scope _ $send)'

        def on_send(node)
          scope?(node) do |second_arg|
            add_offense(second_arg)
          end
        end
      end
    end
  end
end
