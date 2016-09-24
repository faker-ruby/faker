class Object
  def blank?
    return true if self.nil? || self.empty?
    false
  end
end
