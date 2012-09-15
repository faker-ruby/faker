class String

  def constantize
    Faker::Base.constantize self
  end

end
