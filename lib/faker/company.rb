module Faker
  class Company < Base
    flexible :company

    class << self
      def name
        Formats.sample.call
      end
    
      def suffix
        fetch('company.suffix')
      end
      
      # Generate a buzzword-laden catch phrase.
      def catch_phrase
        [buzzword_1, buzzword_2, buzzword_3].join(' ')
      end
      
      # When a straight answer won't do, BS to the rescue!
      def bs
        [bs_1, bs_2, bs_3].join(' ')
      end
    end
    
    Formats = [
      Proc.new { [ Name.last_name, suffix ].join(' ') },
      Proc.new { [ Name.last_name, Name.last_name ].join('-') },
      Proc.new { "%s, %s %s %s" % [ Name.last_name, Name.last_name, plus, Name.last_name ] }
    ]
  end
end
