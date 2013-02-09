module Faker
  class Company < Base
    flexible :company

    class << self
      def name
        parse('company.name')
      end
    
      def suffix
        fetch('company.suffix')
      end
      
      # Generate a buzzword-laden catch phrase.
      def catch_phrase
        translate('faker.company.buzzwords').collect {|list| list.sample }.join(' ')
      end
      
      # When a straight answer won't do, BS to the rescue!
      def bs
        translate('faker.company.bs').collect {|list| list.sample }.join(' ')
      end
      
      def tax_id_number
        numerify(fetch('tax_id_number'))
      end
      
      #aliases for tax id number
      def tin
        self.tax_id_number
      end
      
      def ein
        self.tax_id_number
      end
        
    end
    
  end
end
