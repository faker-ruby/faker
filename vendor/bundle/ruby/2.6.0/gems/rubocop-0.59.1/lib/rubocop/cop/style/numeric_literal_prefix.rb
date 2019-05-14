# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # This cop checks for octal, hex, binary and decimal literals using
      # uppercase prefixes and corrects them to lowercase prefix
      # or no prefix (in case of decimals).
      #
      # @example EnforcedOctalStyle: zero_with_o (default)
      #   # bad - missing octal prefix
      #   num = 01234
      #
      #   # bad - uppercase prefix
      #   num = 0O1234
      #   num = 0X12AB
      #   num = 0B10101
      #
      #   # bad - redundant decimal prefix
      #   num = 0D1234
      #   num = 0d1234
      #
      #   # good
      #   num = 0o1234
      #   num = 0x12AB
      #   num = 0b10101
      #   num = 1234
      #
      # @example EnforcedOctalStyle: zero_only
      #   # bad
      #   num = 0o1234
      #   num = 0O1234
      #
      #   # good
      #   num = 01234
      class NumericLiteralPrefix < Cop
        include IntegerNode

        OCTAL_ZERO_ONLY_REGEX = /^0[Oo][0-7]+$/
        OCTAL_REGEX = /^0O?[0-7]+$/
        HEX_REGEX = /^0X[0-9A-F]+$/
        BINARY_REGEX = /^0B[01]+$/
        DECIMAL_REGEX = /^0[dD][0-9]+$/

        OCTAL_ZERO_ONLY_MSG = 'Use 0 for octal literals.'.freeze
        OCTAL_MSG = 'Use 0o for octal literals.'.freeze
        HEX_MSG = 'Use 0x for hexadecimal literals.'.freeze
        BINARY_MSG = 'Use 0b for binary literals.'.freeze
        DECIMAL_MSG = 'Do not use prefixes for decimal literals.'.freeze

        def on_int(node)
          type = literal_type(node)

          return unless type

          add_offense(node)
        end

        def autocorrect(node)
          lambda do |corrector|
            type = literal_type(node)
            corrector.replace(node.source_range,
                              send(:"format_#{type}", node.source))
          end
        end

        private

        def message(node)
          self.class.const_get("#{literal_type(node).upcase}_MSG")
        end

        def literal_type(node)
          literal = integer_part(node)

          octal_literal_type(literal) || hex_bin_dec_literal_type(literal)
        end

        def octal_literal_type(literal)
          if literal =~ OCTAL_ZERO_ONLY_REGEX && octal_zero_only?
            :octal_zero_only
          elsif literal =~ OCTAL_REGEX && !octal_zero_only?
            :octal
          end
        end

        def hex_bin_dec_literal_type(literal)
          case literal
          when HEX_REGEX
            :hex
          when BINARY_REGEX
            :binary
          when DECIMAL_REGEX
            :decimal
          end
        end

        def octal_zero_only?
          cop_config['EnforcedOctalStyle'] == 'zero_only'
        end

        def format_octal(source)
          source.sub(/^0O?/, '0o')
        end

        def format_octal_zero_only(source)
          source.sub(/^0[Oo]?/, '0')
        end

        def format_hex(source)
          source.sub(/^0X/, '0x')
        end

        def format_binary(source)
          source.sub(/^0B/, '0b')
        end

        def format_decimal(source)
          source.sub(/^0[dD]/, '')
        end
      end
    end
  end
end
