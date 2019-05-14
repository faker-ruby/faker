# frozen_string_literal: true

module RuboCop
  module Cop
    module Rails
      # This cop checks that ActiveSupport aliases to core ruby methods
      # are not used.
      #
      # @example
      #   # good
      #   'some_string'.start_with?('prefix')
      #   'some_string'.end_with?('suffix')
      #   [1, 2, 'a'] << 'b'
      #   [1, 2, 'a'].unshift('b')
      #
      #   # bad
      #   'some_string'.starts_with?('prefix')
      #   'some_string'.ends_with?('suffix')
      #   [1, 2, 'a'].append('b')
      #   [1, 2, 'a'].prepend('b')
      #
      class ActiveSupportAliases < Cop
        MSG = 'Use `%<prefer>s` instead of `%<current>s`.'.freeze

        ALIASES = {
          starts_with?: {
            original: :start_with?, matcher: '(send str :starts_with? _)'
          },
          ends_with?: {
            original: :end_with?, matcher: '(send str :ends_with? _)'
          },
          append: { original: :<<, matcher: '(send array :append _)' },
          prepend: { original: :unshift, matcher: '(send array :prepend _)' }
        }.freeze

        ALIASES.each do |aliased_method, options|
          def_node_matcher aliased_method, options[:matcher]
        end

        def on_send(node)
          ALIASES.each_key do |aliased_method|
            register_offense(node, aliased_method) if
              public_send(aliased_method, node)
          end
        end

        def autocorrect(node)
          return false if append(node)

          lambda do |corrector|
            method_name = node.loc.selector.source
            replacement = ALIASES[method_name.to_sym][:original]
            corrector.replace(node.loc.selector, replacement.to_s)
          end
        end

        private

        def register_offense(node, method_name)
          add_offense(
            node,
            message: format(MSG, prefer: ALIASES[method_name][:original],
                                 current: method_name)
          )
        end
      end
    end
  end
end
