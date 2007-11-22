module Faker
  class Internet
    class << self
      def email(name = nil)
        [ user_name(name), domain_name ].join('@')
      end
      
      def free_email(name = nil)
        [ user_name(name), %w(gmail.com yahoo.com hotmail.com).at_rand ].join('@')
      end
      
      def user_name(name = nil)
        return name.scan(/\w+/).shuffle.join('.') if name
        
        [ 
          Proc.new { Name.first_name.gsub(/\W/, '').downcase },
          Proc.new { 
            [ Name.first_name, Name.last_name ].map {|n| 
              n.gsub(/\W/, '')
            }.join('.').downcase }
        ].at_rand.call
      end
      
      def domain_name
        [ domain_word, domain_suffix ].join('.')
      end
      
      def domain_word
        Company.name.split(' ').first.gsub(/\W/, '').downcase
      end
      
      def domain_suffix
        %w(co.uk com us uk ca biz info name).at_rand
      end
    end
  end
end