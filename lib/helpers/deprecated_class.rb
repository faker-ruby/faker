# frozen_string_literal: true

module Faker
  def self.const_missing(const_name)
    new_class = DeprecatedClass.names[const_name.to_sym]
    super(const_name) unless new_class
    warn "DEPRECATION WARNING: the class Faker::#{const_name} is deprecated. Use Faker::#{new_class} instead."
    Object.const_get("Faker::#{new_class}")
  end

  class Movies
    def self.const_missing(const_name)
      Faker.const_missing("Movies::#{const_name}")
    end
  end

  class DeprecatedClass
    # rubocop:disable Lint/SymbolConversion
    def self.names
      {
        'IDNumber': 'IdNumber',
        'Movies::HarryPotterDeprecated': 'Movies::HarryPotter'
      }
    end
    # rubocop:enable Lint/SymbolConversion
  end
end
