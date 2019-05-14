class Numeric
  HUNDRED     = 10 ** 2
  THOUSAND    = 10 ** 3
  MILLION     = 10 ** 6
  BILLION     = 10 ** 9
  TRILLION    = 10 ** 12
  QUADRILLION = 10 ** 15

  unless Numeric.method_defined? :hundred
    def hundred
      self * HUNDRED
    end
  end

  unless Numeric.method_defined? :thousand
    def thousand
      self * THOUSAND
    end
  end

  unless Numeric.method_defined? :million
    def million
      self * MILLION
    end
  end

  unless Numeric.method_defined? :billion
    def billion
      self * BILLION
    end
  end

  unless Numeric.method_defined? :trillion
    def trillion
      self * TRILLION
    end
  end

  unless Numeric.method_defined? :quadrillion
    def quadrillion
      self * QUADRILLION
    end
  end
end
