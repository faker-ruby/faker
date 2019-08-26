# frozen_string_literal: true

module Faker
  class Relationship < Base
    flexible :relationship

    class << self
      def familial(legacy_connection = NOT_GIVEN, connection: nil)
        if legacy_connection != NOT_GIVEN
          warn_with_uplevel 'Passing `connection` with the 1st argument of `Relationship.familial` is deprecated. Use keyword argument like `Relationship.familial(connection: ...)` instead.', uplevel: 1
          connection = legacy_connection
        end

        familial_connections = translate('faker.relationship.familial').keys

        if connection.nil?
          connection = sample(familial_connections).to_s
        else
          connection = connection.to_s.downcase

          unless familial_connections.include?(connection.to_sym)
            raise ArgumentError,
                  "Familial connections can be left blank or #{familial_connections.join(', ')}"
          end
        end

        fetch('relationship.familial.' + connection)
      end

      def in_law
        fetch('relationship.in_law')
      end

      def spouse
        fetch('relationship.spouse')
      end

      def parent
        fetch('relationship.parent')
      end

      def sibling
        fetch('relationship.sibling')
      end
    end
  end
end
