# frozen_string_literal: true

module RuboCop
  module Cop
    module Performance
      # Reordering `when` conditions with a splat to the end
      # of the `when` branches can improve performance.
      #
      # Ruby has to allocate memory for the splat expansion every time
      # that the `case` `when` statement is run. Since Ruby does not support
      # fall through inside of `case` `when`, like some other languages do,
      # the order of the `when` branches should not matter. By placing any
      # splat expansions at the end of the list of `when` branches we will
      # reduce the number of times that memory has to be allocated for
      # the expansion. The exception to this is if multiple of your `when`
      # conditions can be true for any given condition. A likely scenario for
      # this defining a higher level when condition to override a condition
      # that is inside of the splat expansion.
      #
      # This is not a guaranteed performance improvement. If the data being
      # processed by the `case` condition is normalized in a manner that favors
      # hitting a condition in the splat expansion, it is possible that
      # moving the splat condition to the end will use more memory,
      # and run slightly slower.
      #
      # @example
      #   # bad
      #   case foo
      #   when *condition
      #     bar
      #   when baz
      #     foobar
      #   end
      #
      #   case foo
      #   when *[1, 2, 3, 4]
      #     bar
      #   when 5
      #     baz
      #   end
      #
      #   # good
      #   case foo
      #   when baz
      #     foobar
      #   when *condition
      #     bar
      #   end
      #
      #   case foo
      #   when 1, 2, 3, 4
      #     bar
      #   when 5
      #     baz
      #   end
      class CaseWhenSplat < Cop
        include Alignment
        include RangeHelp

        MSG = 'Reordering `when` conditions with a splat to the end ' \
          'of the `when` branches can improve performance.'.freeze
        ARRAY_MSG = 'Pass the contents of array literals ' \
          'directly to `when` conditions.'.freeze

        def on_case(case_node)
          when_conditions = case_node.when_branches.flat_map(&:conditions)

          splat_offenses(when_conditions).reverse_each do |condition|
            range = condition.parent.loc.keyword.join(condition.source_range)
            variable, = *condition
            message = variable.array_type? ? ARRAY_MSG : MSG
            add_offense(condition.parent, location: range, message: message)
          end
        end

        def autocorrect(when_node)
          lambda do |corrector|
            if needs_reorder?(when_node)
              reorder_condition(corrector, when_node)
            else
              inline_fix_branch(corrector, when_node)
            end
          end
        end

        private

        def replacement(conditions)
          reordered = conditions.partition(&:splat_type?).reverse
          reordered.flatten.map(&:source).join(', ')
        end

        def inline_fix_branch(corrector, when_node)
          conditions = when_node.conditions
          range = range_between(conditions[0].loc.expression.begin_pos,
                                conditions[-1].loc.expression.end_pos)

          corrector.replace(range, replacement(conditions))
        end

        def reorder_condition(corrector, when_node)
          when_branches = when_node.parent.when_branches

          return if when_branches.one?

          corrector.remove(when_branch_range(when_node))
          corrector.insert_after(when_branches.last.source_range,
                                 reordering_correction(when_node))
        end

        def reordering_correction(when_node)
          new_condition = replacement(when_node.conditions)

          if same_line?(when_node, when_node.body)
            new_condition_with_then(when_node, new_condition)
          else
            new_branch_without_then(when_node, new_condition)
          end
        end

        def when_branch_range(when_node)
          next_branch =
            when_node.parent.when_branches[when_node.branch_index + 1]

          range_between(when_node.source_range.begin_pos,
                        next_branch.source_range.begin_pos)
        end

        def new_condition_with_then(node, new_condition)
          "\n#{indent_for(node)}when " \
          "#{new_condition} then #{node.body.source}"
        end

        def new_branch_without_then(node, new_condition)
          "\n#{indent_for(node)}when #{new_condition}" \
          "\n#{indent_for(node.body)}#{node.body.source}"
        end

        def indent_for(node)
          ' ' * node.loc.column
        end

        def splat_offenses(when_conditions)
          found_non_splat = false

          offenses = when_conditions.reverse.map do |condition|
            found_non_splat ||= non_splat?(condition)

            next if non_splat?(condition)

            condition if found_non_splat
          end

          offenses.compact
        end

        def non_splat?(condition)
          variable, = *condition

          (condition.splat_type? && variable.array_type?) ||
            !condition.splat_type?
        end

        def needs_reorder?(when_node)
          following_branches =
            when_node.parent.when_branches[(when_node.branch_index + 1)..-1]

          following_branches.any? do |when_branch|
            when_branch.conditions.any? do |condition|
              non_splat?(condition)
            end
          end
        end
      end
    end
  end
end
