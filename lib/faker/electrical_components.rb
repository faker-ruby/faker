module Faker
  class ElectricalComponents < Base
    flexible :electrical_components

    class << self
      def active
        fetch('electrical_components.active')
      end

      def passive
        fetch('electrical_components.passive')
      end
    end
  end
end
