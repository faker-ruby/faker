# encoding: utf-8
module Faker
  class Number < Base
    class << self

      def between(from = 1, to = 1500, options = {:integer => false})
        custom_number = rand_in_range(from.to_f, to.to_f)
        if options[:integer]
          custom_number.to_i
        else
          custom_number
        end
      end

      def positive(from = 1, to = 1500, options = {:integer => false})
        num = between(from, to, options)
        num = num * -1 if num < 0
        num
      end

      def negative(from = -1500, to = -1, options = {:integer => false})
        num = between(from, to, options)
        num = num * -1 if num > 0
        num
      end

    end
  end
end
