# frozen_string_literal: true

module TTY
  class Pager
    class NullPager < Pager
      # Pass output directly to stdout
      #
      # @api public
      def page(text, &callback)
        return text unless output.tty?

        output.puts(text)
      end
    end
  end # Pager
end # TTY
