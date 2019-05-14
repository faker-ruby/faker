# frozen_string_literal: true

module TTY
  class Tree
    # Render nodes as numbered list
    class NumberRenderer
      def initialize(nodes, options = {})
        @indent = options.fetch(:indent, 4)
        @nodes = nodes
        @mark = ' ' * @indent
      end

      def render
        @nodes.each_with_index.reduce([]) do |acc, (node, i)|
          render_node(acc, node, i, @mark)
        end.join
      end

      private

      def render_node(acc, node, i, mark)
        acc << node.prefix.gsub(/:pipe|:space/, mark)
        unless node.root?
          acc << "#{node.level}.#{i} "
        end
        acc << node.name.to_s + "\n"
      end
    end # NumberRenderer
  end # Tree
end # TTY
