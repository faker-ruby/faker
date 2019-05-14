unless Enumerable.method_defined? :frequencies
  module Enumerable
    # Counts the number of occurrence of items in the enumerable.
    #
    # @return [Hash] in the format value => count
    #
    # @example
    #   [].frequencies # => {}
    #   [1, :symbol, 'string', 3, :symbol, 1].frequencies
    #     #=> { 1 => 2, :symbol => 2, 'string' => 1, 3 => 1 }
    #
    #
    def frequencies
      each_with_object(Hash.new(0)) { |e, a| a[e] += 1 }
    end
  end
end
