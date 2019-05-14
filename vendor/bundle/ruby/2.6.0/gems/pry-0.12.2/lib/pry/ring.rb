class Pry
  # A ring is a thread-safe fixed-capacity array to which you can only add
  # elements. Older entries are overwritten as you add new elements, so that the
  # ring can never contain more than `max_size` elemens.
  #
  # @example
  #   ring = Pry::Ring.new(3)
  #   ring << 1 << 2 << 3
  #   ring.to_a #=> [1, 2, 3]
  #   ring << 4
  #   ring.to_a #=> [2, 3, 4]
  #
  #   ring[0] #=> 2
  #   ring[-1] #=> 4
  #   ring.clear
  #   ring[0] #=> nil
  #
  # @api public
  # @since v0.12.0
  class Ring
    # @return [Integer] maximum buffer size
    attr_reader :max_size

    # @return [Integer] how many objects were added during the lifetime of the
    #   ring
    attr_reader :count
    alias size count

    # @param [Integer] max_size Maximum buffer size. The buffer will start
    #   overwriting elements once its reaches its maximum capacity
    def initialize(max_size)
      @max_size = max_size
      @mutex = Mutex.new
      clear
    end

    # Push `value` to the current index.
    #
    # @param [Object] value
    # @return [self]
    def <<(value)
      @mutex.synchronize do
        @buffer[count % max_size] = value
        @count += 1
        self
      end
    end

    # Read the value stored at `index`.
    #
    # @param [Integer, Range] index The element (if Integer) or elements
    #   (if Range) associated with `index`
    # @return [Object, Array<Object>, nil] element(s) at `index`, `nil` if none
    #   exist
    def [](index)
      @mutex.synchronize do
        return @buffer[(count + index) % max_size] if index.is_a?(Integer)
        return @buffer[index] if count <= max_size

        # Swap parts of array when the array turns page and starts overwriting
        # from the beginning, then apply the range.
        last_part = @buffer.slice([index.end, max_size - 1].min, count % max_size)
        (last_part + (@buffer - last_part))[index]
      end
    end

    # @return [Array<Object>] the buffer as unwinded array
    def to_a
      return @buffer.dup if count <= max_size

      last_part = @buffer.slice(count % max_size, @buffer.size)
      last_part + (@buffer - last_part)
    end

    # Clear the buffer and reset count.
    # @return [void]
    def clear
      @mutex.synchronize do
        @buffer = []
        @count = 0
      end
    end
  end
end
