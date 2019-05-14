# frozen_string_literal: true

require_relative 'tree/node'
require_relative 'tree/directory_renderer'
require_relative 'tree/number_renderer'
require_relative 'tree/hash_walker'
require_relative 'tree/path_walker'
require_relative 'tree/version'

module TTY
  class Tree
    # @api public
    def self.[](data)
      new(data)
    end

    # The list of nodes in this tree.
    attr_reader :nodes

    # Create a Tree
    #
    # @param [String,Dir,Hash] data
    #
    # @api public
    def initialize(data = nil, options = {}, &block)
      @data   = data ? data.dup.freeze : nil
      @walker = select_walker.new(options)
      @nodes  = []

      if @data
        @walker.traverse(data)
        @nodes = @walker.nodes
      end

      @nodes_stack = []

      instance_eval(&block) if block_given?

      freeze
    end

    # Add node to this tree.
    #
    # @param [Symbol,String] name
    #   the name for the node
    #
    # @param [Node, LeafNode] type
    #   the type of node to add
    #
    # @example
    #   TTY::Tree.new do
    #     node '...' do
    #       node '...'
    #     end
    #   end
    #
    # @api public
    def node(name, type = Node, &block)
      parent = @nodes_stack.empty? ? Node::ROOT : @nodes_stack.last
      level = [0, @nodes_stack.size - 1].max
      prefix = ':pipe' * level
      if parent.class == LeafNode
        prefix = ':space' * level
      end
      node = type.new(name, parent.full_path, prefix, @nodes_stack.size)
      @nodes << node

      return unless block_given?

      @nodes_stack << node
      if block.arity.zero?
        instance_eval(&block)
      else
        instance_eval(&(->(*_args) { block[node] }))
      end
      @nodes_stack.pop
    end

    # Add leaf node
    #
    # @api public
    def leaf(name, &block)
      node(name, LeafNode, &block)
    end

    # @api public
    def render(options = {})
      as = options.delete(:as) || :dir
      renderer = select_renderer(as).new(nodes, options)
      renderer.render
    end

    private

    # @api private
    def select_walker
      if @data.is_a?(Hash) || @data.nil?
        HashWalker
      else
        @data ||= Dir.pwd
        PathWalker
      end
    end

    def select_renderer(as)
      case as
      when :dir, :directory then DirectoryRenderer
      when :num, :number then NumberRenderer
      end
    end
  end # Tree
end # TTY
