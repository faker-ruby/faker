class Array
  unless instance_methods.include?("sample")
    def sample
      choice
    end
  end
end