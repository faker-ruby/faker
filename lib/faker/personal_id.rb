module Faker
  class PersonalId < Base
    class << self
      def ssn
        "%03i-00-%04i" % [ Random.rand(999), Random.rand(9999)]
      end

      def nino
        "QQ%06i%s" % [ Random.rand(999999), (65 + rand(4)).chr ]
      end

      def sin
         "0%02i-%03i-%03i" % [ Random.rand(99), Random.rand(999), Random.rand(999)]
      end
    end
  end
end