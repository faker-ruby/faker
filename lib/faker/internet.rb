module Faker
  class Internet < Base
    class << self
      def email(name = nil)
        [ user_name(name), domain_name ].join('@')
      end
      
      def free_email(name = nil)
        [ user_name(name), fetch('internet.free_email') ].join('@')
      end
      
      def user_name(name = nil)
        return name.scan(/\w+/).shuffle.join(%w(. _).rand).downcase if name
        
        [ 
          Proc.new { Name.first_name.gsub(/\W/, '').downcase },
          Proc.new { 
            [ Name.first_name, Name.last_name ].map {|n| 
              n.gsub(/\W/, '')
            }.join(%w(. _).rand).downcase }
        ].rand.call
      end
      
      def domain_name
        [ domain_word, domain_suffix ].join('.')
      end
      
      def domain_word
        Company.name.split(' ').first.gsub(/\W/, '').downcase
      end
      
      def domain_suffix
        fetch('internet.domain_suffix')
      end
      
      def ip_v4_address
        ary = (2..255).to_a
        [ary.rand,
        ary.rand,
        ary.rand,
        ary.rand].join('.')
      end

      def ip_v6_address
        @@ip_v6_space ||= (0..65535).to_a
        container = (1..8).map{ |_| @@ip_v6_space.rand }
        container.map{ |n| n.to_s(16) }.join(':')
      end
      
      def mac_address
        hex_ary = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E']
        [hex_ary.rand + hex_ary.rand,
        hex_ary.rand + hex_ary.rand,
        hex_ary.rand + hex_ary.rand,
        hex_ary.rand + hex_ary.rand,
        hex_ary.rand + hex_ary.rand,
        hex_ary.rand + hex_ary.rand].join(':')
      end
    end
  end
end
