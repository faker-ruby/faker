# frozen_string_literal: true

module Faker
  class Fantasy
    if ENV['LAZY_LOAD'] == '1'
      Faker.lazy_load(self)
    end
  end
end
