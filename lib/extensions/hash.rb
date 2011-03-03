class Hash
  def recursively(meth=nil)
    raise ArgumentError, "Must pass a method name or a block" unless block_given? or meth
    meth ? send(meth) : yield(self)
    each { |key, value| self[key] = value.recursively(meth) if value.respond_to?(:recursively) }
    self
  end unless method_defined?(:recursively)

  def symbolize_keys
    dup.symbolize_keys!
  end unless method_defined?(:symbolize_keys!)

  def symbolize_keys!
    keys.each do |key|
      new_key       = (key.to_sym rescue key.to_s.to_sym)
      self[new_key] = delete(key)
    end
    self
  end unless method_defined?(:symbolize_keys!)
end
