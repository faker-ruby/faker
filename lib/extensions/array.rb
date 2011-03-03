class Array
  def sample
    self[rand(length)]
  end unless method_defined?(:sample)
end
