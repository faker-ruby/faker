# frozen_string_literal: true

require_relative '../strings'

module Strings
  module Extensions
    refine String do
      def align(*args)
        Align.align(self, *args)
      end

      def align_left(*args)
        Align.align_left(self, *args)
      end

      def align_right(*args)
        Align.align_right(self, *args)
      end

      def ansi?
        ANSI.ansi?(self)
      end

      def fold(*args)
        Fold.fold(self, *args)
      end

      def pad(*args)
        Pad.pad(self, *args)
      end

      def sanitize
        ANSI.sanitize(self)
      end

      def truncate(*args)
        Truncate.truncate(self, *args)
      end

      def wrap(*args)
        Wrap.wrap(self, *args)
      end
    end
  end # Extensions
end # Strings
