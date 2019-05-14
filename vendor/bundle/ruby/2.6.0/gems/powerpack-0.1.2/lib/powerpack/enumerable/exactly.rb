unless Enumerable.method_defined? :exactly?
  module Enumerable
    # Checks if exactly n elements meet a certain predicate.
    #
    # @param n [Fixnum] the number of matches required
    # @return [Boolean] true if we get exactly n matches, false otherwise
    #
    # @example
    #   [1, 2, 3, 4].exactly?(1) { |n| n > 3 } #=> true
    #   [1, 2, 3, 4].exactly?(2, &:even?) #=> true
    #   [1, 1, 3, 3].exactly?(2, &:even?) #=> false
    #
    # Without a block uses the identify of the elements as default predicate.
    # This means that nil and false elements will be ignored.
    #
    # @example
    #   [1, false, nil].exactly?(3) #=> false
    #   [1, false, nil].exactly?(1) #=> true
    #   [false, nil].exactly?(0) #=> true
    #   [1, 2, 3].exactly?(3) #=>true
    def exactly?(n)
      found_count = 0

      if block_given?
        each do |*o|
          if yield(*o)
            found_count += 1
            return false if found_count > n
          end
        end
      else
        each do |o|
          if o
            found_count += 1
            return false if found_count > n
          end
        end
      end

      n == found_count
    end
  end
end
