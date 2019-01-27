# frozen_string_literal: true

module Faker
  module LoremPixel
    class << self
      extend Gem::Deprecate

      SUPPORTED_CATEGORIES = %w[abstract
                                animals
                                business
                                cats
                                city
                                food
                                nightlife
                                fashion
                                people
                                nature
                                sports
                                technics
                                transport].freeze

      # rubocop:disable Metrics/ParameterLists
      def image(size = '300x300', is_gray = false, category = nil, number = nil, text = nil, secure: true)
        Faker::Lorem::Pixel.image(size, is_gray, category, number, text, secure: secure)
      end
      # rubocop:enable Metrics/ParameterLists

      deprecate :image, 'Faker::Lorem::Pixel.image', 2018, 10
    end
  end
end
