+module Faker
 +  class VentureBros < Base
 +    class << self
 +      def character
 +        fetch('venture_bros.character')
 +      end

        def organizations
          fetch('venture_bros.organizations')
        end

+       def vehicles
+         fetch('venture_bros.vehicles')
+       end
 +
 +      def quotes
 +        fetch('venture_bros.quotes')
 +      end
 +    end
 +  end
 +end
