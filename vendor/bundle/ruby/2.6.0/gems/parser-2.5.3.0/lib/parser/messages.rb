# frozen_string_literal: true

module Parser
  ##
  # Diagnostic messages (errors, warnings and notices) that can be generated.
  #
  # @see Diagnostic
  #
  # @api public
  #
  MESSAGES = {
    # Lexer errors
    :unicode_point_too_large => 'invalid Unicode codepoint (too large)',
    :invalid_escape          => 'invalid escape character syntax',
    :incomplete_escape       => 'incomplete character syntax',
    :invalid_hex_escape      => 'invalid hex escape',
    :invalid_unicode_escape  => 'invalid Unicode escape',
    :unterminated_unicode    => 'unterminated Unicode escape',
    :escape_eof              => 'escape sequence meets end of file',
    :string_eof              => 'unterminated string meets end of file',
    :regexp_options          => 'unknown regexp options: %{options}',
    :cvar_name               => "`%{name}' is not allowed as a class variable name",
    :ivar_name               => "`%{name}' is not allowed as an instance variable name",
    :trailing_in_number      => "trailing `%{character}' in number",
    :empty_numeric           => 'numeric literal without digits',
    :invalid_octal           => 'invalid octal digit',
    :no_dot_digit_literal    => 'no .<digit> floating literal anymore; put 0 before dot',
    :bare_backslash          => 'bare backslash only allowed before newline',
    :unexpected              => "unexpected `%{character}'",
    :embedded_document       => 'embedded document meets end of file (and they embark on a romantic journey)',
    :heredoc_id_has_newline  => 'here document identifier across newlines, never match',
    :heredoc_id_ends_with_nl => 'here document identifier ends with a newline',

    # Lexer warnings
    :invalid_escape_use      => 'invalid character syntax; use ?%{escape}',
    :ambiguous_literal       => 'ambiguous first argument; put parentheses or a space even after the operator',
    :ambiguous_prefix        => "`%{prefix}' interpreted as argument prefix",

    # Parser errors
    :nth_ref_alias           => 'cannot define an alias for a back-reference variable',
    :begin_in_method         => 'BEGIN in method',
    :backref_assignment      => 'cannot assign to a back-reference variable',
    :invalid_assignment      => 'cannot assign to a keyword',
    :module_name_const       => 'class or module name must be a constant literal',
    :unexpected_token        => 'unexpected token %{token}',
    :argument_const          => 'formal argument cannot be a constant',
    :argument_ivar           => 'formal argument cannot be an instance variable',
    :argument_gvar           => 'formal argument cannot be a global variable',
    :argument_cvar           => 'formal argument cannot be a class variable',
    :duplicate_argument      => 'duplicate argument name',
    :empty_symbol            => 'empty symbol literal',
    :odd_hash                => 'odd number of entries for a hash',
    :singleton_literal       => 'cannot define a singleton method for a literal',
    :dynamic_const           => 'dynamic constant assignment',
    :const_reassignment      => 'constant re-assignment',
    :module_in_def           => 'module definition in method body',
    :class_in_def            => 'class definition in method body',
    :unexpected_percent_str  => '%{type}: unknown type of percent-literal',
    :block_and_blockarg      => 'both block argument and literal block are passed',
    :masgn_as_condition      => 'multiple assignment in conditional context',
    :block_given_to_yield    => 'block given to yield',
    :invalid_regexp          => '%{message}',
    :invalid_return          => 'Invalid return in class/module body',

    # Parser warnings
    :useless_else            => 'else without rescue is useless',

    # Parser errors that are not Ruby errors
    :invalid_encoding        => 'literal contains escape sequences incompatible with UTF-8',

    # Rewriter diagnostics
    :invalid_action          => 'cannot %{action}',
    :clobbered               => 'clobbered by: %{action}',

    # Rewriter diagnostics
    :different_replacements        => 'different replacements: %{replacement} vs %{other_replacement}',
    :swallowed_insertions          => 'this replacement:',
    :swallowed_insertions_conflict => 'swallows some inner rewriting actions:',
    :crossing_deletions            => 'the deletion of:',
    :crossing_deletions_conflict   => 'is crossing:',
    :crossing_insertions           => 'the rewriting action on:',
    :crossing_insertions_conflict  => 'is crossing that on:',
  }.freeze
end
