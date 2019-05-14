# frozen_string_literal: true

require 'pathname'

require_relative 'node'

module TTY
  class Tree
    # Walk and collect nodes from directory.
    #
    # @api public
    class PathWalker
      attr_reader :nodes

      attr_reader :files_count

      attr_reader :dirs_count

      # Create a PathWalker
      #
      # @api public
      def initialize(**options)
        @files_count = 0
        @dirs_count  = 0
        @nodes       = []
        @filters     = []
        @level       = options.fetch(:level) { -1 }
        @file_limit  = options.fetch(:file_limit) { - 1 }

        unless options[:show_hidden]
          add_filter(-> (p) { !p.basename.to_s.start_with?('.') })
        end

        if options[:only_dirs]
          add_filter(-> (p) { p.directory? })
        end
      end

      def add_filter(filter)
        @filters << filter
      end

      # Traverse given path recursively
      #
      # @param [String] path
      #   the path to traverse
      #
      # @api public
      def traverse(path)
        root_path  = Pathname.new(path)
        empty_path = Pathname.new('')

        unless root_path.directory?
          raise ArgumentError, "#{root_path} is not a directory path"
        end

        @nodes << Node.new(root_path, empty_path, '', 0)

        walk(root_path, root_path.children, '', 1)
      end

      private

      # Filter entries
      #
      # @api private
      def filter_entries(entries, filters)
        return entries if filters.nil? || filters.empty?
        filter = filters[0]
        filter_entries(entries.select(&filter), filters[1..-1])
      end

      # Walk paths recursively
      #
      # @api private
      def walk(parent_path, entries, prefix, level)
        if entries.empty? || (@level != -1 && @level < level)
          return
        else
          return if @file_limit != -1 && entries.size > @file_limit
          processed_paths = filter_entries(entries, @filters).sort
          last_path_index = processed_paths.size - 1

          processed_paths.each_with_index do |path, i|
            sub_path = path.relative_path_from(parent_path)

            node = last_path_index == i ? LeafNode : Node

            if path.directory?
              next if @level != -1 && level + 1 > @level

              @nodes << node.new(sub_path, parent_path, prefix, level)
              @dirs_count += 1

              postfix = ':pipe'
              postfix = ':space' if i == last_path_index

              walk(path, path.children, prefix + postfix, level + 1)
            elsif path.file?
              @nodes << node.new(path, parent_path, prefix, level)
              @files_count += 1
            end
          end
        end
      end
    end # PathWalker
  end # Tree
end # TTY
