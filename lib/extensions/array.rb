class Array
  def rand
    self[Kernel.rand(length)]
  end
end
