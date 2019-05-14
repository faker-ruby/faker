# frozen_string_literal: true

module RuboCop
  module AST
    # `RuboCop::AST::Builder` is an AST builder that is utilized to let `Parser`
    # generate ASTs with {RuboCop::AST::Node}.
    #
    # @example
    #   buffer = Parser::Source::Buffer.new('(string)')
    #   buffer.source = 'puts :foo'
    #
    #   builder = RuboCop::AST::Builder.new
    #   require 'parser/ruby25'
    #   parser = Parser::Ruby25.new(builder)
    #   root_node = parser.parse(buffer)
    class Builder < Parser::Builders::Default
      NODE_MAP = {
        and:        AndNode,
        args:       ArgsNode,
        array:      ArrayNode,
        block:      BlockNode,
        case:       CaseNode,
        def:        DefNode,
        defined?:   DefinedNode,
        defs:       DefNode,
        ensure:     EnsureNode,
        for:        ForNode,
        hash:       HashNode,
        if:         IfNode,
        kwsplat:    KeywordSplatNode,
        or:         OrNode,
        pair:       PairNode,
        regexp:     RegexpNode,
        resbody:    ResbodyNode,
        csend:      SendNode,
        send:       SendNode,
        str:        StrNode,
        dstr:       StrNode,
        xstr:       StrNode,
        super:      SuperNode,
        zsuper:     SuperNode,
        sym:        SymbolNode,
        until:      UntilNode,
        until_post: UntilNode,
        when:       WhenNode,
        while:      WhileNode,
        while_post: WhileNode,
        yield:      YieldNode
      }.freeze

      # Generates {Node} from the given information.
      #
      # @return [Node] the generated node
      def n(type, children, source_map)
        node_klass(type).new(type, children, location: source_map)
      end

      # TODO: Figure out what to do about literal encoding handling...
      # More details here https://github.com/whitequark/parser/issues/283
      def string_value(token)
        value(token)
      end

      private

      def node_klass(type)
        NODE_MAP[type] || Node
      end
    end
  end
end
