class Hash
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
