# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # Helper module to provide common methods to classes needed for the
      # ConditionalAssignment Cop.
      module ConditionalAssignmentHelper
        extend NodePattern::Macros

        EQUAL = '='.freeze
        END_ALIGNMENT = 'Layout/EndAlignment'.freeze
        ALIGN_WITH = 'EnforcedStyleAlignWith'.freeze
        KEYWORD = 'keyword'.freeze

        # `elsif` branches show up in the `node` as an `else`. We need
        # to recursively iterate over all `else` branches and consider all
        # but the last `node` an `elsif` branch and consider the last `node`
        # the actual `else` branch.
        def expand_elses(branch)
          elsif_branches = expand_elsif(branch)
          else_branch = elsif_branches.any? ? elsif_branches.pop : branch
          [elsif_branches, else_branch]
        end

        # `when` nodes contain the entire branch including the condition.
        # We only need the contents of the branch, not the condition.
        def expand_when_branches(when_branches)
          when_branches.map { |branch| branch.children[1] }
        end

        def tail(branch)
          branch.begin_type? ? [*branch].last : branch
        end

        # rubocop:disable Metrics/AbcSize
        def lhs(node)
          case node.type
          when :send
            lhs_for_send(node)
          when :op_asgn
            "#{node.children[0].source} #{node.children[1]}= "
          when :and_asgn, :or_asgn
            "#{node.children[0].source} #{node.loc.operator.source} "
          when :casgn
            "#{node.children[1]} = "
          when *ConditionalAssignment::VARIABLE_ASSIGNMENT_TYPES
            "#{node.children[0]} = "
          else
            node.source
          end
        end
        # rubocop:enable Metrics/AbcSize

        def indent(cop, source)
          conf = cop.config.for_cop(END_ALIGNMENT)
          if conf[ALIGN_WITH] == KEYWORD
            ' ' * source.length
          else
            ''
          end
        end

        def end_with_eq?(sym)
          sym.to_s.end_with?(EQUAL)
        end

        private

        def expand_elsif(node, elsif_branches = [])
          return [] if node.nil? || !node.if_type?

          _condition, elsif_branch, else_branch = *node
          elsif_branches << elsif_branch
          if else_branch && else_branch.if_type?
            expand_elsif(else_branch, elsif_branches)
          else
            elsif_branches << else_branch
          end
          elsif_branches
        end

        def lhs_for_send(node)
          receiver = node.receiver ? node.receiver.source : ''

          if node.method?(:[]=)
            indices = node.arguments[0...-1].map(&:source).join(', ')
            "#{receiver}[#{indices}] = "
          elsif node.setter_method?
            "#{receiver}.#{node.method_name[0...-1]} = "
          else
            "#{receiver} #{node.method_name} "
          end
        end

        def setter_method?(method_name)
          method_name.to_s.end_with?(EQUAL) &&
            !%i[!= == === >= <=].include?(method_name)
        end

        def assignment_rhs_exist?(node)
          parent = node.parent
          return true unless parent

          !(parent.mlhs_type? || parent.resbody_type?)
        end
      end

      # Check for `if` and `case` statements where each branch is used for
      # assignment to the same variable when using the return of the
      # condition can be used instead.
      #
      # @example EnforcedStyle: assign_to_condition (default)
      #   # bad
      #   if foo
      #     bar = 1
      #   else
      #     bar = 2
      #   end
      #
      #   case foo
      #   when 'a'
      #     bar += 1
      #   else
      #     bar += 2
      #   end
      #
      #   if foo
      #     some_method
      #     bar = 1
      #   else
      #     some_other_method
      #     bar = 2
      #   end
      #
      #   # good
      #   bar = if foo
      #           1
      #         else
      #           2
      #         end
      #
      #   bar += case foo
      #          when 'a'
      #            1
      #          else
      #            2
      #          end
      #
      #   bar << if foo
      #            some_method
      #            1
      #          else
      #            some_other_method
      #            2
      #          end
      #
      # @example EnforcedStyle: assign_inside_condition
      #   # bad
      #   bar = if foo
      #           1
      #         else
      #           2
      #         end
      #
      #   bar += case foo
      #          when 'a'
      #            1
      #          else
      #            2
      #          end
      #
      #   bar << if foo
      #            some_method
      #            1
      #          else
      #            some_other_method
      #            2
      #          end
      #
      #   # good
      #   if foo
      #     bar = 1
      #   else
      #     bar = 2
      #   end
      #
      #   case foo
      #   when 'a'
      #     bar += 1
      #   else
      #     bar += 2
      #   end
      #
      #   if foo
      #     some_method
      #     bar = 1
      #   else
      #     some_other_method
      #     bar = 2
      #   end
      class ConditionalAssignment < Cop
        include ConditionalAssignmentHelper
        include ConfigurableEnforcedStyle
        include IgnoredNode

        MSG = 'Use the return of the conditional for variable assignment ' \
              'and comparison.'.freeze
        ASSIGN_TO_CONDITION_MSG =
          'Assign variables inside of conditionals'.freeze
        VARIABLE_ASSIGNMENT_TYPES =
          %i[casgn cvasgn gvasgn ivasgn lvasgn].freeze
        ASSIGNMENT_TYPES = VARIABLE_ASSIGNMENT_TYPES +
                           %i[and_asgn or_asgn op_asgn masgn].freeze
        LINE_LENGTH = 'Metrics/LineLength'.freeze
        INDENTATION_WIDTH = 'Layout/IndentationWidth'.freeze
        ENABLED = 'Enabled'.freeze
        MAX = 'Max'.freeze
        SINGLE_LINE_CONDITIONS_ONLY = 'SingleLineConditionsOnly'.freeze
        WIDTH = 'Width'.freeze

        def_node_matcher :condition?, '{if case}'

        # The shovel operator `<<` does not have its own type. It is a `send`
        # type.
        def_node_matcher :assignment_type?, <<-PATTERN
          {
            #{ASSIGNMENT_TYPES.join(' ')}
            (send _recv {:[]= :<< :=~ :!~ :<=> #end_with_eq?} ...)
          }
        PATTERN

        ASSIGNMENT_TYPES.each do |type|
          define_method "on_#{type}" do |node|
            return if part_of_ignored_node?(node)

            check_assignment_to_condition(node)
          end
        end

        def on_send(node)
          return unless assignment_type?(node)

          check_assignment_to_condition(node)
        end

        def on_if(node)
          return unless style == :assign_to_condition
          return if node.elsif?

          else_branch = node.else_branch
          elsif_branches, else_branch = expand_elses(else_branch)

          return unless else_branch

          branches = [node.if_branch, *elsif_branches, else_branch]

          check_node(node, branches)
        end

        def on_case(node)
          return unless style == :assign_to_condition
          return unless node.else_branch

          when_branches = expand_when_branches(node.when_branches)
          branches = [*when_branches, node.else_branch]

          check_node(node, branches)
        end

        def autocorrect(node)
          if assignment_type?(node)
            move_assignment_inside_condition(node)
          else
            move_assignment_outside_condition(node)
          end
        end

        private

        def check_assignment_to_condition(node)
          return unless candidate_node?(node)

          ignore_node(node)

          assignment = assignment_node(node)
          return unless candidate_condition?(assignment)

          _condition, *branches, else_branch = *assignment

          return unless else_branch
          return if allowed_single_line?([*branches, else_branch])

          add_offense(node, message: ASSIGN_TO_CONDITION_MSG)
        end

        def candidate_node?(node)
          style == :assign_inside_condition && assignment_rhs_exist?(node)
        end

        def_node_matcher :candidate_condition?, '[{if case} !#allowed_ternary?]'

        def allowed_ternary?(assignment)
          assignment.if_type? && assignment.ternary? && !include_ternary?
        end

        def allowed_single_line?(branches)
          single_line_conditions_only? && branches.any?(&:begin_type?)
        end

        def assignment_node(node)
          *_variable, assignment = *node

          # ignore pseudo-assignments without rhs in for nodes
          return if node.parent && node.parent.for_type?

          if assignment.begin_type? && assignment.children.one?
            assignment, = *assignment
          end

          assignment
        end

        def move_assignment_outside_condition(node)
          if node.case_type?
            CaseCorrector.correct(self, node)
          elsif node.ternary?
            TernaryCorrector.correct(node)
          elsif node.if?
            IfCorrector.correct(self, node)
          elsif node.unless?
            UnlessCorrector.correct(self, node)
          end
        end

        def move_assignment_inside_condition(node)
          *_assignment, condition = *node

          if ternary_condition?(condition)
            TernaryCorrector.move_assignment_inside_condition(node)
          elsif condition.case_type?
            CaseCorrector.move_assignment_inside_condition(node)
          elsif condition.if_type?
            IfCorrector.move_assignment_inside_condition(node)
          end
        end

        def ternary_condition?(node)
          [node, node.children.first].any? { |n| n.if_type? && n.ternary? }
        end

        def lhs_all_match?(branches)
          first_lhs = lhs(branches.first)
          branches.all? { |branch| lhs(branch) == first_lhs }
        end

        def assignment_types_match?(*nodes)
          return unless assignment_type?(nodes.first)

          nodes.map(&:type).uniq.one?
        end

        def check_node(node, branches)
          return if allowed_ternary?(node)
          return unless allowed_statements?(branches)
          return if allowed_single_line?(branches)
          return if correction_exceeds_line_limit?(node, branches)

          add_offense(node)
        end

        def allowed_statements?(branches)
          return false unless branches.all?

          statements = branches.map { |branch| tail(branch) }

          lhs_all_match?(statements) && statements.none?(&:masgn_type?) &&
            assignment_types_match?(*statements)
        end

        # If `Metrics/LineLength` is enabled, we do not want to introduce an
        # offense by auto-correcting this cop. Find the max configured line
        # length. Find the longest line of condition. Remove the assignment
        # from lines that contain the offending assignment because after
        # correcting, this will not be on the line anymore. Check if the length
        # of the longest line + the length of the corrected assignment is
        # greater than the max configured line length
        def correction_exceeds_line_limit?(node, branches)
          return false unless line_length_cop_enabled?

          assignment = lhs(tail(branches[0]))

          longest_line_exceeds_line_limit?(node, assignment)
        end

        def longest_line_exceeds_line_limit?(node, assignment)
          longest_line(node, assignment).length > max_line_length
        end

        def longest_line(node, assignment)
          assignment_regex = /\s*#{Regexp.escape(assignment).gsub('\ ', '\s*')}/
          lines = node.source.lines.map do |line|
            line.chomp.sub(assignment_regex, '')
          end
          longest_line = lines.max_by(&:length)
          assignment + longest_line
        end

        def line_length_cop_enabled?
          config.for_cop(LINE_LENGTH)[ENABLED]
        end

        def max_line_length
          config.for_cop(LINE_LENGTH)[MAX]
        end

        def indentation_width
          config.for_cop(INDENTATION_WIDTH)[WIDTH] || 2
        end

        def single_line_conditions_only?
          cop_config[SINGLE_LINE_CONDITIONS_ONLY]
        end

        def include_ternary?
          cop_config['IncludeTernaryExpressions']
        end
      end

      # Helper module to provide common methods to ConditionalAssignment
      # correctors
      module ConditionalCorrectorHelper
        def remove_whitespace_in_branches(corrector, branch, condition, column)
          branch.each_node do |child|
            white_space = white_space_range(child, column)
            corrector.remove(white_space) if white_space.source.strip.empty?
          end

          [condition.loc.else, condition.loc.end].each do |loc|
            corrector.remove_preceding(loc, loc.column - column)
          end
        end

        def white_space_range(node, column)
          expression = node.loc.expression
          begin_pos = expression.begin_pos - (expression.column - column - 2)

          Parser::Source::Range.new(expression.source_buffer,
                                    begin_pos,
                                    expression.begin_pos)
        end

        def assignment(node)
          *_, condition = *node
          Parser::Source::Range.new(node.loc.expression.source_buffer,
                                    node.loc.expression.begin_pos,
                                    condition.loc.expression.begin_pos)
        end

        def correct_if_branches(corrector, cop, node)
          if_branch, elsif_branches, else_branch = extract_tail_branches(node)

          corrector.insert_before(node.source_range, lhs(if_branch))
          replace_branch_assignment(corrector, if_branch)
          correct_branches(corrector, elsif_branches)
          replace_branch_assignment(corrector, else_branch)
          corrector.insert_before(node.loc.end, indent(cop, lhs(if_branch)))
        end

        def replace_branch_assignment(corrector, branch)
          _variable, *_operator, assignment = *branch
          source = assignment.source

          replacement = if assignment.array_type? && !assignment.bracketed?
                          "[#{source}]"
                        else
                          source
                        end

          corrector.replace(branch.source_range, replacement)
        end

        def correct_branches(corrector, branches)
          branches.each do |branch|
            *_, assignment = *branch
            corrector.replace(branch.source_range, assignment.source)
          end
        end
      end

      # Corrector to correct conditional assignment in ternary conditions.
      class TernaryCorrector
        class << self
          include ConditionalAssignmentHelper
          include ConditionalCorrectorHelper

          def correct(node)
            lambda do |corrector|
              corrector.replace(node.source_range, correction(node))
            end
          end

          def move_assignment_inside_condition(node)
            *_var, rhs = *node
            if_branch, else_branch = extract_branches(node)
            assignment = assignment(node)

            lambda do |corrector|
              remove_parentheses(corrector, rhs) if Util.parentheses?(rhs)
              corrector.remove(assignment)

              move_branch_inside_condition(corrector, if_branch, assignment)
              move_branch_inside_condition(corrector, else_branch, assignment)
            end
          end

          private

          def correction(node)
            condition, if_branch, else_branch = *node

            "#{lhs(if_branch)}#{ternary(condition, if_branch, else_branch)}"
          end

          def ternary(condition, if_branch, else_branch)
            _variable, *_operator, if_rhs = *if_branch
            _else_variable, *_operator, else_rhs = *else_branch

            expr = "#{condition.source} ? #{if_rhs.source} : #{else_rhs.source}"

            element_assignment?(if_branch) ? "(#{expr})" : expr
          end

          def element_assignment?(node)
            node.send_type? && node.method_name != :[]=
          end

          def extract_branches(node)
            *_var, rhs = *node
            condition, = *rhs if rhs.begin_type? && rhs.children.one?
            _condition, if_branch, else_branch = *(condition || rhs)

            [if_branch, else_branch]
          end

          def remove_parentheses(corrector, node)
            corrector.remove(node.loc.begin)
            corrector.remove(node.loc.end)
          end

          def move_branch_inside_condition(corrector, branch, assignment)
            corrector.insert_before(branch.loc.expression, assignment.source)
          end
        end
      end

      # Corrector to correct conditional assignment in `if` statements.
      class IfCorrector
        class << self
          include ConditionalAssignmentHelper
          include ConditionalCorrectorHelper

          def correct(cop, node)
            ->(corrector) { correct_if_branches(corrector, cop, node) }
          end

          def move_assignment_inside_condition(node)
            column = node.loc.expression.column
            *_var, condition = *node
            assignment = assignment(node)

            lambda do |corrector|
              corrector.remove(assignment)

              extract_branches(condition).flatten.each do |branch|
                move_branch_inside_condition(corrector, branch, condition,
                                             assignment, column)
              end
            end
          end

          private

          def extract_tail_branches(node)
            if_branch, elsif_branches, else_branch = extract_branches(node)
            elsif_branches.map! { |branch| tail(branch) }

            [tail(if_branch), elsif_branches, tail(else_branch)]
          end

          def extract_branches(node)
            _condition, if_branch, else_branch = *node
            elsif_branches, else_branch = expand_elses(else_branch)

            [if_branch, elsif_branches, else_branch]
          end

          def move_branch_inside_condition(corrector, branch, condition,
                                           assignment, column)
            branch_assignment = tail(branch)
            corrector.insert_before(branch_assignment.loc.expression,
                                    assignment.source)

            remove_whitespace_in_branches(corrector, branch, condition, column)

            branch_else = branch.parent.loc.else
            corrector.remove_preceding(branch_else, branch_else.column - column)
          end
        end
      end

      # Corrector to correct conditional assignment in `case` statements.
      class CaseCorrector
        class << self
          include ConditionalAssignmentHelper
          include ConditionalCorrectorHelper

          def correct(cop, node)
            when_branches, else_branch = extract_tail_branches(node)

            lambda do |corrector|
              corrector.insert_before(node.source_range, lhs(else_branch))
              correct_branches(corrector, when_branches)
              replace_branch_assignment(corrector, else_branch)

              corrector.insert_before(node.loc.end,
                                      indent(cop, lhs(else_branch)))
            end
          end

          def move_assignment_inside_condition(node)
            column = node.loc.expression.column
            *_var, condition = *node
            assignment = assignment(node)

            lambda do |corrector|
              corrector.remove(assignment)

              extract_branches(condition).flatten.each do |branch|
                move_branch_inside_condition(corrector, branch, condition,
                                             assignment, column)
              end
            end
          end

          private

          def extract_tail_branches(node)
            when_branches, else_branch = extract_branches(node)
            when_branches.map! { |branch| tail(branch) }
            [when_branches, tail(else_branch)]
          end

          def extract_branches(node)
            _condition, *when_branches, else_branch = *node
            when_branches = expand_when_branches(when_branches)
            [when_branches, else_branch]
          end

          def move_branch_inside_condition(corrector, branch, condition,
                                           assignment, column)
            branch_assignment = tail(branch)
            corrector.insert_before(branch_assignment.loc.expression,
                                    assignment.source)

            remove_whitespace_in_branches(corrector, branch, condition, column)

            parent_keyword = branch.parent.loc.keyword
            corrector.remove_preceding(parent_keyword,
                                       parent_keyword.column - column)
          end
        end
      end

      # Corrector to correct conditional assignment in `unless` statements.
      class UnlessCorrector
        class << self
          include ConditionalAssignmentHelper
          include ConditionalCorrectorHelper

          def correct(cop, node)
            ->(corrector) { correct_if_branches(corrector, cop, node) }
          end

          private

          def extract_tail_branches(node)
            _condition, else_branch, if_branch = *node

            [tail(if_branch), [], tail(else_branch)]
          end
        end
      end
    end
  end
end
