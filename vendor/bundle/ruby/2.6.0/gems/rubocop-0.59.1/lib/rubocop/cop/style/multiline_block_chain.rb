# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # This cop checks for chaining of a block after another block that spans
      # multiple lines.
      #
      # @example
      #
      #   Thread.list.find_all do |t|
      #     t.alive?
      #   end.map do |t|
      #     t.object_id
      #   end
      class MultilineBlockChain < Cop
        include RangeHelp

        MSG = 'Avoid multi-line chains of blocks.'.freeze

        def on_block(node)
          node.send_node.each_node(:send) do |send_node|
            receiver = send_node.receiver

            next unless receiver && receiver.block_type? && receiver.multiline?

            range = range_between(receiver.loc.end.begin_pos,
                                  node.send_node.source_range.end_pos)

            add_offense(nil, location: range)

            # Done. If there are more blocks in the chain, they will be
            # found by subsequent calls to on_block.
            break
          end
        end
      end
    end
  end
end
