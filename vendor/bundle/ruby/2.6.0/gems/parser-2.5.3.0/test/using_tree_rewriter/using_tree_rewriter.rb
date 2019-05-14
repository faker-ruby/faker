# frozen_string_literal: true

class UsingTreeRewriter < Parser::TreeRewriter
  def on_send(node)
    wrap(node.loc.expression, '(', ')')
    wrap(node.children[0].loc.expression, '[', ']')
    super
  end
end
