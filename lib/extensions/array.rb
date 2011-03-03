class Array
  def sample
    self[rand(length)]
  end unless defined?(:sample)
end
