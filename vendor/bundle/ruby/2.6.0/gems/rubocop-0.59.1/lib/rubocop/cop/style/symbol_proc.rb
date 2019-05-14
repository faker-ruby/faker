# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # Use symbols as procs when possible.
      #
      # @example
      #   # bad
      #   something.map { |s| s.upcase }
      #
      #   # good
      #   something.map(&:upcase)
      class SymbolProc < Cop
        include RangeHelp
        include IgnoredMethods

        MSG = 'Pass `&:%<method>s` as an argument to `%<block_method>s` ' \
              'instead of a block.'.freeze
        SUPER_TYPES = %i[super zsuper].freeze

        def_node_matcher :proc_node?, '(send (const nil? :Proc) :new)'
        def_node_matcher :symbol_proc?, <<-PATTERN
          (block
            ${(send ...) (super ...) zsuper}
            $(args (arg _var))
            (send (lvar _var) $_))
        PATTERN

        def self.autocorrect_incompatible_with
          [Layout::SpaceBeforeBlockBraces]
        end

        def on_block(node)
          symbol_proc?(node) do |send_or_super, block_args, method|
            block_method_name = resolve_block_method_name(send_or_super)

            # TODO: Rails-specific handling that we should probably make
            # configurable - https://github.com/rubocop-hq/rubocop/issues/1485
            # we should ignore lambdas & procs
            return if proc_node?(send_or_super)
            return if %i[lambda proc].include?(block_method_name)
            return if ignored_method?(block_method_name)
            return if block_args.children.size == 1 &&
                      block_args.source.include?(',')

            offense(node, method, block_method_name)
          end
        end

        def autocorrect(node)
          lambda do |corrector|
            block_send_or_super, _block_args, block_body = *node
            _receiver, method_name, _args = *block_body

            if super?(block_send_or_super)
              args = *block_send_or_super
            else
              _breceiver, _bmethod_name, *args = *block_send_or_super
            end
            autocorrect_method(corrector, node, args, method_name)
          end
        end

        private

        def resolve_block_method_name(block_send_or_super)
          return :super if super?(block_send_or_super)

          _receiver, method_name, _args = *block_send_or_super
          method_name
        end

        def offense(node, method_name, block_method_name)
          block_start = node.loc.begin.begin_pos
          block_end = node.loc.end.end_pos
          range = range_between(block_start, block_end)

          add_offense(node,
                      location: range,
                      message: format(MSG,
                                      method: method_name,
                                      block_method: block_method_name))
        end

        def autocorrect_method(corrector, node, args, method_name)
          if args.empty?
            autocorrect_no_args(corrector, node, method_name)
          else
            autocorrect_with_args(corrector, node, args, method_name)
          end
        end

        def autocorrect_no_args(corrector, node, method_name)
          corrector.replace(block_range_with_space(node), "(&:#{method_name})")
        end

        def autocorrect_with_args(corrector, node, args, method_name)
          arg_range = args.last.source_range
          arg_range = range_with_surrounding_comma(arg_range, :right)
          replacement = " &:#{method_name}"
          replacement = ',' + replacement unless arg_range.source.end_with?(',')
          corrector.insert_after(arg_range, replacement)
          corrector.remove(block_range_with_space(node))
        end

        def block_range_with_space(node)
          block_range = range_between(begin_pos_for_replacement(node),
                                      node.loc.end.end_pos)
          range_with_surrounding_space(range: block_range, side: :left)
        end

        def begin_pos_for_replacement(node)
          block_send_or_super, _block_args, _block_body = *node
          expr = block_send_or_super.source_range

          if (paren_pos = (expr.source =~ /\(\s*\)$/))
            expr.begin_pos + paren_pos
          else
            node.loc.begin.begin_pos
          end
        end

        def super?(node)
          SUPER_TYPES.include?(node.type)
        end
      end
    end
  end
end
