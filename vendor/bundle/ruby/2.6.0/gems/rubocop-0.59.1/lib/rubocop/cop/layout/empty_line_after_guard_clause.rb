# frozen_string_literal: true

module RuboCop
  module Cop
    module Layout
      # This cop enforces empty line after guard clause
      #
      # @example
      #
      #   # bad
      #   def foo
      #     return if need_return?
      #     bar
      #   end
      #
      #   # good
      #   def foo
      #     return if need_return?
      #
      #     bar
      #   end
      #
      #   # good
      #   def foo
      #     return if something?
      #     return if something_different?
      #
      #     bar
      #   end
      #
      #   # also good
      #   def foo
      #     if something?
      #       do_something
      #       return if need_return?
      #     end
      #   end
      class EmptyLineAfterGuardClause < Cop
        include RangeHelp

        MSG = 'Add empty line after guard clause.'.freeze
        END_OF_HEREDOC_LINE = 1

        def on_if(node)
          return if correct_style?(node)

          if last_argument_is_heredoc?(node)
            heredoc_node = last_argument(node)

            heredoc_body = heredoc_node.loc.heredoc_body
            num_of_heredoc_lines =
              heredoc_body.last_line - heredoc_body.first_line

            line = node.last_line + num_of_heredoc_lines + END_OF_HEREDOC_LINE

            return if next_line_empty?(line)

            add_offense(heredoc_node, location: :heredoc_end)
          else
            return if next_line_empty?(node.last_line)

            add_offense(node)
          end
        end

        def autocorrect(node)
          lambda do |corrector|
            node_range = if node.respond_to?(:heredoc?) && node.heredoc?
                           range_by_whole_lines(node.loc.heredoc_body)
                         else
                           range_by_whole_lines(node.source_range)
                         end

            corrector.insert_after(node_range, "\n")
          end
        end

        private

        def correct_style?(node)
          !contains_guard_clause?(node) ||
            next_line_rescue_or_ensure?(node) ||
            next_sibling_parent_empty_or_else?(node) ||
            next_sibling_empty_or_guard_clause?(node)
        end

        def contains_guard_clause?(node)
          node.if_branch && node.if_branch.guard_clause?
        end

        def next_line_empty?(line)
          processed_source[line].blank?
        end

        def next_line_rescue_or_ensure?(node)
          parent = node.parent
          parent.nil? || parent.rescue_type? || parent.ensure_type?
        end

        def next_sibling_parent_empty_or_else?(node)
          next_sibling = node.parent.children[node.sibling_index + 1]
          return true if next_sibling.nil?

          parent = next_sibling.parent

          parent && parent.if_type? && parent.else?
        end

        def next_sibling_empty_or_guard_clause?(node)
          next_sibling = node.parent.children[node.sibling_index + 1]
          return true if next_sibling.nil?

          next_sibling.if_type? && contains_guard_clause?(next_sibling)
        end

        def last_argument_is_heredoc?(node)
          last_children = node.if_branch

          return false unless last_children && last_children.send_type?

          last_argument = last_argument(node)

          last_argument.respond_to?(:heredoc?) && last_argument.heredoc?
        end

        def last_argument(node)
          node.if_branch.children.last
        end
      end
    end
  end
end
