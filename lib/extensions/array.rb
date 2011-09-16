class Array
  unless self.method_defined? :sample
    def sample
      choice
    end
  end
end