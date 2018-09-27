# frozen_string_literal: true

module Faker
  module LoremPixel
    class << self
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
    end
  end
end
