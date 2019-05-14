Contributing to Parser
----------------------

Parser employs a script to extract information from VCS (git) log and form a Changelog file. Thus, each commit which affects the public API in any way must be marked with one of the following sigils, or characters at the beginning of line:

 * `-` for bugfixes. For example: `- lexer.rl: fixed lexing of "alias $foo $bar".`
 * `+` for features. For example: `+ Implemented Parser::Rewriter, a module for non-intrusive rewriting of source code.`
 * `*` for miscellaneous changes. For example: `* Converted measurement units from metric to imperial.`

Versioning
----------

Parser is versioned as follows:
 * The version starts with the most recent Ruby version that Parser supports (which should be also the most recent released Ruby version).
 * After that, a `.x` is appended, where `x` is incremented for every change.

No breaking changes to API will be ever made, except for changes that correct behavior which did not match documentation or Ruby MRI behavior.
