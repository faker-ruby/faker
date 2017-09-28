module Faker
  class Arguments
    def self.to_named(args = [], names = [])
      matching_names = names.take(args.length)
      Hash[matching_names.zip(args)]
    end
  end
end
