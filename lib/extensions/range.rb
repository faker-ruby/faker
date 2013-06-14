class Range
  def sample(n=1)
    ary = (1..n).map do
      first, last = first(), last()
      if first.respond_to?(:random_delta) # TODO: work on this!!!
        begin
          first.random_delta(last, exclude_end?)
        rescue
          to_a.sample
        end
      else
        to_a.sample
      end
    end
    n == 1 ? ary.first : ary
  end unless method_defined?(:sample)
end
