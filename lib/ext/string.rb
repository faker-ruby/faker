# frozen_string_literal: true

class String
  ##
  # Produces the name of a city.
  #
  # @param options [Hash]
  # @option with_state [Boolean] Whether to include the state name in the output.
  # @return [String]
  #
  # @example
  #   Faker::Name.first_name #=> "F'lar'"
  #   Faker::Name.first_name.clear_special_characters
  #     #=> "Flar"
  #
  # @faker.version next
  def clear_special_characters
    gsub(/[^0-9A-Za-z ]/, '')
  end
end
