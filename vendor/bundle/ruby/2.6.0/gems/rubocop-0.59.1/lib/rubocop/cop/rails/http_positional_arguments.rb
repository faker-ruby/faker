# frozen_string_literal: true

module RuboCop
  module Cop
    module Rails
      # This cop is used to identify usages of http methods like `get`, `post`,
      # `put`, `patch` without the usage of keyword arguments in your tests and
      # change them to use keyword args. This cop only applies to Rails >= 5.
      # If you are running Rails < 5 you should disable the
      # Rails/HttpPositionalArguments cop or set your TargetRailsVersion in your
      # .rubocop.yml file to 4.0, etc.
      #
      # @example
      #   # bad
      #   get :new, { user_id: 1}
      #
      #   # good
      #   get :new, params: { user_id: 1 }
      class HttpPositionalArguments < Cop
        extend TargetRailsVersion

        MSG = 'Use keyword arguments instead of ' \
              'positional arguments for http call: `%<verb>s`.'.freeze
        KEYWORD_ARGS = %i[
          method params session body flash xhr as headers env
        ].freeze
        HTTP_METHODS = %i[get post put patch delete head].freeze

        minimum_target_rails_version 5.0

        def_node_matcher :http_request?, <<-PATTERN
          (send nil? {#{HTTP_METHODS.map(&:inspect).join(' ')}} !nil? $_ ...)
        PATTERN

        def on_send(node)
          http_request?(node) do |data|
            return unless needs_conversion?(data)

            add_offense(node, location: :selector,
                              message: format(MSG, verb: node.method_name))
          end
        end

        # given a pre Rails 5 method: get :new, {user_id: @user.id}, {}
        #
        # @return lambda of auto correct procedure
        # the result should look like:
        #     get :new, params: { user_id: @user.id }, session: {}
        # the http_method is the method used to call the controller
        # the controller node can be a symbol, method, object or string
        # that represents the path/action on the Rails controller
        # the data is the http parameters and environment sent in
        # the Rails 5 http call
        def autocorrect(node)
          http_path, *data = *node.arguments

          controller_action = http_path.source
          params = convert_hash_data(data.first, 'params')
          session = convert_hash_data(data.last, 'session') if data.size > 1
          # the range of the text to replace, which is the whole line
          code_to_replace = node.loc.expression
          # what to replace with
          format = parentheses_format(node)
          new_code = format(format, name: node.method_name,
                                    action: controller_action,
                                    params: params, session: session)
          ->(corrector) { corrector.replace(code_to_replace, new_code) }
        end

        private

        def needs_conversion?(data)
          return true unless data.hash_type?

          data.each_pair.none? do |pair|
            special_keyword_arg?(pair.key) ||
              format_arg?(pair.key) && data.pairs.one?
          end
        end

        def special_keyword_arg?(node)
          node.sym_type? && KEYWORD_ARGS.include?(node.value)
        end

        def format_arg?(node)
          node.sym_type? && node.value == :format
        end

        def convert_hash_data(data, type)
          return '' if data.hash_type? && data.empty?

          hash_data = if data.hash_type?
                        format('{ %<data>s }',
                               data: data.pairs.map(&:source).join(', '))
                      else
                        # user supplies an object,
                        # no need to surround with braces
                        data.source
                      end

          format(', %<type>s: %<hash_data>s', type: type, hash_data: hash_data)
        end

        def parentheses_format(node)
          if parentheses?(node)
            '%<name>s(%<action>s%<params>s%<session>s)'
          else
            '%<name>s %<action>s%<params>s%<session>s'
          end
        end
      end
    end
  end
end
