# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # Checks for uses of if/unless modifiers with multiple-lines bodies.
      #
      # @example
      #
      #   # bad
      #   {
      #     result: 'this should not happen'
      #   } unless cond
      #
      #   # good
      #   { result: 'ok' } if cond
      class MultilineIfModifier < Cop
        include StatementModifier
        include Alignment

        MSG = 'Favor a normal %<keyword>s-statement over a modifier' \
              ' clause in a multiline statement.'.freeze

        def on_if(node)
          return unless node.modifier_form? && node.body.multiline?

          add_offense(node)
        end

        def autocorrect(node)
          lambda do |corrector|
            corrector.replace(node.source_range, to_normal_if(node))
          end
        end

        private

        def message(node)
          format(MSG, keyword: node.keyword)
        end

        def to_normal_if(node)
          indented_body = indented_body(node.body, node)
          condition = "#{node.keyword} #{node.condition.source}"
          indented_end = "#{offset(node)}end"

          [condition, indented_body, indented_end].join("\n")
        end

        def configured_indentation_width
          super || 2
        end

        def indented_body(body, node)
          body_source = "#{offset(node)}#{body.source}"
          body_source.each_line.map do |line|
            if line == "\n"
              line
            else
              line.sub(/^\s{#{offset(node).length}}/, indentation(node))
            end
          end.join
        end
      end
    end
  end
end
