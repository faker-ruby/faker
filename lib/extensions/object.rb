class Object
  def self.add_method(method_name, &block)
    define_method(method_name, &block)
  end
end

unless Object.respond_to? :blank?
  Object.add_method 'blank?' do
    self.nil? || self.empty? ? true : false
  end
end
