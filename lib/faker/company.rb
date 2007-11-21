module Faker
  class Company
    class << self
      def name
        Formats.at_rand.call
      end
    
      def suffix
        %w(Inc and\ Sons LLC Group).at_rand
      end
    end
    
    Formats = [
      Proc.new { [ Name.last_name, suffix ].join(' ') },
      Proc.new { [ Name.last_name, Name.last_name ].join('-') },
      Proc.new { "%s, %s and %s" % [ Name.last_name, Name.last_name, Name.last_name ] }
      ]
  end
end