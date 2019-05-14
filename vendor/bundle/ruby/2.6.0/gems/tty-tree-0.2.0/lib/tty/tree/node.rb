# frozen_string_literal: true

require 'forwardable'
require 'pathname'

module TTY
  class Tree
    # A representation of tree node
    #
    # @api private
    class Node
      extend Forwardable

      # The base name for the directory or file
      attr_reader :name

      # The parent directory path
      attr_reader :parent

      # The require path prefix
      attr_reader :prefix

      # The directory depth
      attr_reader :level

      # The file stat
      attr_reader :stat

      # The current path
      attr_reader :path

      def_delegators :@path, :directory?, :executable?, :file?,
                     :symlink?, :socket?, :pipe?

      def initialize(path, parent, prefix, level)
        @path   = Pathname.new(path)
        @name   = @path.basename
        @parent = Pathname.new(parent)
        @prefix = prefix
        @level  = level
      end

      def full_path
        return parent if name.to_s.empty?
        parent.join(name)
      end

      def root?
        parent.to_s.empty?
      end

      def hidden?
        name.to_s.start_with?('.')
      end

      def leaf?
        false
      end

      def to_s
        @name
      end

      def ==(other)
        other.is_a?(self.class) && other.state_attrs == state_attrs
      end
      alias eql? ==

      protected

      def state_attrs
        [@name, @path, @parent, @prefix, @level]
      end

      ROOT = Node.new('', Pathname.new(''), '', 0).freeze
    end # Node

    class LeafNode < Node
      def leaf?
        true
      end
    end # LeafNode
  end # Tree
end # TTY
