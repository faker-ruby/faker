# frozen_string_literal: true

module Faker
  class Fantasy
    if Faker::Config.lazy_loading?
      Faker.lazy_load(self)
    end
  end
end
