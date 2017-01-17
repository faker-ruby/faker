module Faker
  class ElectricalComponents < Base
    flexible :electrical_components

    class << self
      def active
        fetch('electrical_components.active')
      end
    end
  end
end
