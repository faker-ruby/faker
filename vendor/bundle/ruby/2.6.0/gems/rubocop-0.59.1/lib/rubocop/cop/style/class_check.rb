# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # This cop enforces consistent use of `Object#is_a?` or `Object#kind_of?`.
      #
      # @example EnforcedStyle: is_a? (default)
      #   # bad
      #   var.kind_of?(Date)
      #   var.kind_of?(Integer)
      #
      #   # good
      #   var.is_a?(Date)
      #   var.is_a?(Integer)
      #
      # @example EnforcedStyle: kind_of?
      #   # bad
      #   var.is_a?(Time)
      #   var.is_a?(String)
      #
      #   # good
      #   var.kind_of?(Time)
      #   var.kind_of?(String)
      #
      class ClassCheck < Cop
        include ConfigurableEnforcedStyle

        MSG = 'Prefer `Object#%<prefer>s` over `Object#%<current>s`.'.freeze

        def_node_matcher :class_check?, '(send _ ${:is_a? :kind_of?} _)'

        def on_send(node)
          class_check?(node) do |method_name|
            return if style == method_name

            add_offense(node, location: :selector)
          end
        end

        def autocorrect(node)
          lambda do |corrector|
            replacement = node.method?(:is_a?) ? 'kind_of?' : 'is_a?'

            corrector.replace(node.loc.selector, replacement)
          end
        end

        def message(node)
          if node.method?(:is_a?)
            format(MSG, prefer: 'kind_of?', current: 'is_a?')
          else
            format(MSG, prefer: 'is_a?', current: 'kind_of?')
          end
        end
      end
    end
  end
end
