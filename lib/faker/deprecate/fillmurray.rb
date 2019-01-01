# frozen_string_literal: true

module Faker
  class Fillmurray < Base
    class << self
      extend Gem::Deprecate

      def image(grayscale = false, width = 200, height = 200)
        Faker::Quotes::Fillmurray.image(grayscale, width, height)
      end

      deprecate :image, 'Faker::Quotes::Fillmurray.image', 2018, 12
    end
  end
end
