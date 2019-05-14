# frozen_string_literal: true

module RuboCop
  module Formatter
    # This formatter formats report data using the Test Anything Protocol.
    # TAP allows for to communicate tests results in a language agnostics way.
    class TapFormatter < ClangStyleFormatter
      def started(target_files)
        super
        @progress_count = 1
        output.puts "1..#{target_files.size}"
      end

      def file_finished(file, offenses)
        if offenses.empty?
          output.puts "ok #{@progress_count} - #{smart_path(file)}"
        else
          output.puts "not ok #{@progress_count} - #{smart_path(file)}"

          count_stats(offenses)
          report_file(file, offenses)
        end

        @progress_count += 1
      end

      private

      def report_line(location)
        source_line = location.source_line

        if location.first_line == location.last_line
          output.puts("# #{source_line}")
        else
          output.puts("# #{source_line} #{yellow(ELLIPSES)}")
        end
      end

      def report_highlighted_area(highlighted_area)
        output.puts("# #{' ' * highlighted_area.begin_pos}" \
                    "#{'^' * highlighted_area.size}")
      end

      def report_offense(file, offense)
        output.printf("# %s:%d:%d: %s: %s\n",
                      cyan(smart_path(file)), offense.line, offense.real_column,
                      colored_severity_code(offense), message(offense))

        # rubocop:disable Lint/HandleExceptions
        begin
          return unless valid_line?(offense)

          report_line(offense.location)
          report_highlighted_area(offense.highlighted_area)
        rescue IndexError
          # range is not on a valid line; perhaps the source file is empty
        end
        # rubocop:enable Lint/HandleExceptions
      end

      def annotate_message(msg)
        msg.gsub(/`(.*?)`/, '\1')
      end

      def message(offense)
        message = offense.corrected? ? '[Corrected] ' : ''
        "#{message}#{annotate_message(offense.message)}"
      end
    end
  end
end
