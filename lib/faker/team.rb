module Faker
  class Team < Base
    flexible :team

    class << self
      def name
        parse('team.name')
      end

      def creature
        fetch('team.creature')
      end

      def state
        fetch('faker.address.state').titleize
      end
    end

  end
end
