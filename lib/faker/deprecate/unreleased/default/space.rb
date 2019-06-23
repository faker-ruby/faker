# frozen_string_literal: true

module Faker
  module Space
    class << self
      extend Gem::Deprecate

      def launch_vehicule
        Faker::Space.launch_vehicule
      end

      deprecate :launch_vehicule, 'Faker::Space.launch_vehicle', 2019, 06
    end
  end
end
