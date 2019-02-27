# frozen_string_literal: true

module Faker
  class FictionalCharacters < Base
    flexible :fictional_characters

    class << self
      def name
        fetch(fetch('fictional_characters'))
      end
    end
  end
end
