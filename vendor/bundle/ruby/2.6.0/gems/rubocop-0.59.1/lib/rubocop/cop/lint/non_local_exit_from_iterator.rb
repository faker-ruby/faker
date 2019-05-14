# frozen_string_literal: true

module RuboCop
  module Cop
    module Lint
      # This cop checks for non-local exits from iterators without a return
      # value. It registers an offense under these conditions:
      #
      #  - No value is returned,
      #  - the block is preceded by a method chain,
      #  - the block has arguments,
      #  - the method which receives the block is not `define_method`
      #    or `define_singleton_method`,
      #  - the return is not contained in an inner scope, e.g. a lambda or a
      #    method definition.
      #
      # @example
      #
      #   class ItemApi
      #     rescue_from ValidationError do |e| # non-iteration block with arg
      #       return { message: 'validation error' } unless e.errors # allowed
      #       error_array = e.errors.map do |error| # block with method chain
      #         return if error.suppress? # warned
      #         return "#{error.param}: invalid" unless error.message # allowed
      #         "#{error.param}: #{error.message}"
      #       end
      #       { message: 'validation error', errors: error_array }
      #     end
      #
      #     def update_items
      #       transaction do # block without arguments
      #         return unless update_necessary? # allowed
      #         find_each do |item| # block without method chain
      #           return if item.stock == 0 # false-negative...
      #           item.update!(foobar: true)
      #         end
      #       end
      #     end
      #   end
      #
      class NonLocalExitFromIterator < Cop
        MSG = 'Non-local exit from iterator, without return value. ' \
              '`next`, `break`, `Array#find`, `Array#any?`, etc. ' \
              'is preferred.'.freeze

        def on_return(return_node)
          return if return_value?(return_node)

          return_node.each_ancestor(:block, :def, :defs) do |node|
            break if scoped_node?(node)

            send_node, args_node, _body_node = *node

            # if a proc is passed to `Module#define_method` or
            # `Object#define_singleton_method`, `return` will not cause a
            # non-local exit error
            break if define_method?(send_node)

            next if args_node.children.empty?

            if chained_send?(send_node)
              add_offense(return_node, location: :keyword)
              break
            end
          end
        end

        private

        def scoped_node?(node)
          node.def_type? || node.defs_type? || node.lambda?
        end

        def return_value?(return_node)
          !return_node.children.empty?
        end

        def_node_matcher :chained_send?, '(send !nil? ...)'
        def_node_matcher :define_method?, <<-PATTERN
          (send _ {:define_method :define_singleton_method} _)
        PATTERN
      end
    end
  end
end
