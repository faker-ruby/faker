# frozen_string_literal: true

if RUBY_VERSION =~ /^1\.[89]\./
  require 'parser/version'
  raise LoadError, <<-UNSUPPORTED_VERSION_MSG
parser v#{Parser::VERSION} cannot run on Ruby #{RUBY_VERSION}.
Please upgrade to Ruby 2.0.0 or higher, or use an older version of the parser gem.
  UNSUPPORTED_VERSION_MSG
end

require 'set'
require 'racc/parser'

require 'ast'

##
# @api public
#
module Parser
  require 'parser/version'
  require 'parser/messages'
  require 'parser/deprecation'

  module AST
    require 'parser/ast/node'
    require 'parser/ast/processor'
    require 'parser/meta'
  end

  module Source
    require 'parser/source/buffer'
    require 'parser/source/range'

    require 'parser/source/comment'
    require 'parser/source/comment/associator'

    require 'parser/source/rewriter'
    require 'parser/source/rewriter/action'
    require 'parser/source/tree_rewriter'
    require 'parser/source/tree_rewriter/action'

    require 'parser/source/map'
    require 'parser/source/map/operator'
    require 'parser/source/map/collection'
    require 'parser/source/map/constant'
    require 'parser/source/map/variable'
    require 'parser/source/map/keyword'
    require 'parser/source/map/definition'
    require 'parser/source/map/send'
    require 'parser/source/map/index'
    require 'parser/source/map/condition'
    require 'parser/source/map/ternary'
    require 'parser/source/map/for'
    require 'parser/source/map/rescue_body'
    require 'parser/source/map/heredoc'
    require 'parser/source/map/objc_kwarg'
  end

  require 'parser/syntax_error'
  require 'parser/clobbering_error'
  require 'parser/diagnostic'
  require 'parser/diagnostic/engine'

  require 'parser/static_environment'

  require 'parser/lexer'
  require 'parser/lexer/literal'
  require 'parser/lexer/stack_state'
  require 'parser/lexer/dedenter'

  module Builders
    require 'parser/builders/default'
  end

  require 'parser/context'

  require 'parser/base'

  require 'parser/rewriter'
  require 'parser/tree_rewriter'
end
