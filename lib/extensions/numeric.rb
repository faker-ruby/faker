class Integer
  def random_delta(last, exclude_end)
    first = self
    last -= 1 if exclude_end
    return nil if last < first
    return rand(last - first + 1) + first
  end unless method_defined?(:random_delta)
end

class Numeric
  def random_delta(last, exclude_end)
    first = self
    return nil if last < first
    return nil if exclude_end && last == first
    return (last - first) * rand + first
  end unless method_defined?(:random_delta)
end
