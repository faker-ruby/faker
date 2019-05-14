unless Enumerable.method_defined? :several?
  module Enumerable
    # Checks if two or more elements meet a certain predicate.
    #
    # @example
    #   [1, 2, 3, 4].several?(&:even?) #=> true
    #   [1, 1, 3, 3].several?(&:even?) #=> false
    #
    # Without a block uses the identify of the elements as default predicate.
    # This means that nil and false elements will be ignored.
    #
    # @example
    #   [1, false, nil].several? #=> false
    #   [1, 2, 3].several? #=>true
    def several?
      found_count = 0

      if block_given?
        each do |*o|
          if yield(*o)
            found_count += 1
            return true if found_count > 1
          end
        end
      else
        each do |o|
          if o
            found_count += 1
            return true if found_count > 1
          end
        end
      end

      false
    end
  end
end
