# frozen_string_literal: true

require 'pathname'

require_relative 'node'

module TTY
  class Tree
    # Walk and collect nodes from hash data strcture.
    #
    # @api public
    class HashWalker
      attr_reader :nodes

      attr_reader :files_count

      attr_reader :dirs_count

      def initialize(options = {})
        @nodes       = []
        @files_count = 0
        @dirs_count  = 0
        @level       = options.fetch(:level) { -1 }
        @file_limit  = options.fetch(:file_limit) { - 1 }
      end

      def traverse(data)
        walk(data, Pathname.new(''), '', 0, false)
      end

      def walk(data, parent_path, prefix, level, is_last)
        node = is_last ? LeafNode : Node

        case data
        when Hash
          return if @level != -1 && level + 1 > @level

          data.each do |dir, item|
            dir_node = node.new(dir.to_s, parent_path, prefix, level)
            @nodes << dir_node
            @dirs_count += 1 unless dir_node.root?

            if level > 0
              postfix = ':pipe'
              postfix = ':space' if is_last
            else
              postfix = ''
            end

            walk(item, parent_path + dir.to_s,
                 prefix + postfix, level + 1, false)
          end
        when Array
          return if @file_limit != -1 && data.size > @file_limit

          last_data_index = data.size - 1

          data.each_with_index do |item, i|
            last = (last_data_index == i)

            walk(item, parent_path, prefix, level, last)
          end
        else
          @nodes << node.new(data.to_s, parent_path, prefix, level)
          @files_count += 1
        end
      end
    end # HashWalker
  end # Tree
end # TTY
