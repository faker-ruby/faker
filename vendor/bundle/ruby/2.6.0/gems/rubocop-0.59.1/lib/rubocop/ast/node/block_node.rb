# frozen_string_literal: true

module RuboCop
  module AST
    # A node extension for `block` nodes. This will be used in place of a plain
    # node when the builder constructs the AST, making its methods available
    # to all `send` nodes within RuboCop.
    #
    # A `block` node is essentially a method send with a block. Parser nests
    # the `send` node inside the `block` node.
    class BlockNode < Node
      VOID_CONTEXT_METHODS = %i[each tap].freeze

      # The `send` node associated with this block.
      #
      # @return [SendNode] the `send` node associated with the `block` node
      def send_node
        node_parts[0]
      end

      # The arguments of this block.
      #
      # @return [Array<Node>]
      def arguments
        node_parts[1]
      end

      # The body of this block.
      #
      # @return [Node, nil] the body of the `block` node or `nil`
      def body
        node_parts[2]
      end

      # The name of the dispatched method as a symbol.
      #
      # @return [Symbol] the name of the dispatched method
      def method_name
        send_node.method_name
      end

      # Checks whether this block takes any arguments.
      #
      # @return [Boolean] whether this `block` node takes any arguments
      def arguments?
        !arguments.empty?
      end

      # Checks whether the `block` literal is delimited by curly braces.
      #
      # @return [Boolean] whether the `block` literal is enclosed in braces
      def braces?
        loc.end && loc.end.is?('}')
      end

      # Checks whether the `block` literal is delimited by `do`-`end` keywords.
      #
      # @return [Boolean] whether the `block` literal is enclosed in `do`-`end`
      def keywords?
        loc.end && loc.end.is?('end')
      end

      # The delimiters for this `block` literal.
      #
      # @return [Array<String>] the delimiters for the `block` literal
      def delimiters
        [loc.begin.source, loc.end.source].freeze
      end

      # The opening delimiter for this `block` literal.
      #
      # @return [String] the opening delimiter for the `block` literal
      def opening_delimiter
        delimiters.first
      end

      # The closing delimiter for this `block` literal.
      #
      # @return [String] the closing delimiter for the `block` literal
      def closing_delimiter
        delimiters.last
      end

      # Checks whether this is a single line block. This is overridden here
      # because the general version in `Node` does not work for `block` nodes.
      #
      # @return [Boolean] whether the `block` literal is on a single line
      def single_line?
        loc.begin.line == loc.end.line
      end

      # Checks whether this is a multiline block. This is overridden here
      # because the general version in `Node` does not work for `block` nodes.
      #
      # @return [Boolean] whether the `block` literal is on a several lines
      def multiline?
        !single_line?
      end

      # Checks whether this `block` literal belongs to a lambda.
      #
      # @return [Boolean] whether the `block` literal belongs to a lambda
      def lambda?
        send_node.method?(:lambda)
      end

      # Checks whether this node body is a void context.
      #
      # @return [Boolean] whether the `block` node body is a void context
      def void_context?
        VOID_CONTEXT_METHODS.include?(method_name)
      end
    end
  end
end
