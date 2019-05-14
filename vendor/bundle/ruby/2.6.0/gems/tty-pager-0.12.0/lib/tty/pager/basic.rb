# frozen_string_literal: true

require 'strings'

module TTY
  class Pager
    # A basic pager is used to work on systems where
    # system pager is not supported.
    #
    # @api public
    class BasicPager < Pager
      PAGE_BREAK = "\n--- Page -%s- " \
                    "Press enter/return to continue " \
                    "(or q to quit) ---".freeze

      # Create a basic pager
      #
      # @option options [Integer] :height
      #   the terminal height
      # @option options [Integer] :width
      #   the terminal width
      #
      # @api public
      def initialize(**options)
        super
        @height  = options.fetch(:height) { page_height }
        @width   = options.fetch(:width)  { page_width }
        @prompt  = options.fetch(:prompt) { default_prompt }
        prompt_height = PAGE_BREAK.lines.to_a.size
        @height -= prompt_height
      end

      # Default prompt for paging
      #
      # @return [Proc]
      #
      # @api private
      def default_prompt
        proc { |page_num| output.puts Strings.wrap(PAGE_BREAK % page_num, @width) }
      end

      # Page text
      #
      # @api public
      def page(text, &callback)
        page_num = 1
        leftover = []
        lines_left = @height

        text.lines.each do |line|
          chunk = []
          if !leftover.empty?
            chunk = leftover
            leftover = []
          end
          wrapped_line = Strings.wrap(line, @width)
          wrapped_line.lines.each do |line_part|
            if lines_left > 0
              chunk << line_part
              lines_left -= 1
            else
              leftover << line_part
            end
          end
          output.print(chunk.join)

          if lines_left == 0
            break unless continue_paging?(page_num)
            lines_left = @height
            if leftover.size > 0
              lines_left -= leftover.size
            end
            page_num += 1
            return !callback.call(page_num) unless callback.nil?
          end
        end

        if leftover.size > 0
          output.print(leftover.join)
        end
      end

      private

      # @api private
      def continue_paging?(page_num)
        instance_exec(page_num, &@prompt)
        !@input.gets.chomp[/q/i]
      end
    end # BasicPager
  end # Pager
end # TTY
