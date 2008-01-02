class Object
  def returning(value)
    yield(value)
    value
  end
end
