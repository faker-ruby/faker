# encoding: utf-8
module Faker
  class Internet < Base
    class << self
      def email(name = nil)
        [ user_name(name), domain_name ].join('@')
      end

      def free_email(name = nil)
        [ user_name(name), fetch('internet.free_email') ].join('@')
      end

      def safe_email(name = nil)
        [user_name(name), 'example.'+ %w[org com net].shuffle.first].join('@')
      end

      def user_name(specifier = nil, separators = %w(. _))
        if specifier.kind_of? String
          return specifier.scan(/\w+/).shuffle.join(separators.sample).downcase
        elsif specifier.kind_of? Integer
          tries = 0 # Don't try forever in case we get something like 1_000_000.
          begin
            result = user_name nil, separators
            tries += 1
          end while result.length < specifier and tries < 7
          until result.length >= specifier
            result = result * 2
          end
          return result
        elsif specifier.kind_of? Range
          tries = 0
          begin
            result = user_name specifier.min, separators
            tries += 1
          end while not specifier.include? result.length and tries < 7
          return result[0...specifier.max]
        end

        fix_umlauts([
          Proc.new { Name.first_name.gsub(/\W/, '').downcase },
          Proc.new {
            [ Name.first_name, Name.last_name ].map {|n|
              n.gsub(/\W/, '')
            }.join(separators.sample).downcase }
        ].sample.call)
      end

      def password(min_length = 8, max_length = 16)
        temp = Lorem.characters(min_length)
        diff_length = max_length - min_length
        if diff_length > 0
          diff_rand = rand(diff_length + 1)
          temp += Lorem.characters(diff_rand)
        end
        temp = temp[0..min_length] if min_length > 0
        return temp
      end

      def domain_name
        [ fix_umlauts(domain_word), domain_suffix ].join('.')
      end

      def fix_umlauts(string)
        string = string.gsub('ä','a')
        string = string.gsub('Ä','a')
        string = string.gsub('ö','o')
        string = string.gsub('Ö','ö')
        string = string.gsub('ü','u')
        string = string.gsub('Ü','u')
        string = string.gsub('ß','sz')
        string = string.gsub('þ','th')
        string = string.gsub('Þ','th')
        string = string.gsub('æ','ae')
        string = string.gsub('Æ','æ')
        string = string.gsub('á','a')
        string = string.gsub('Á','a')
        string = string.gsub('ó','o')
        string = string.gsub('Ó','o')
        string = string.gsub('é','e')
        string = string.gsub('É','e')
        string = string.gsub('ú','u')
        string = string.gsub('Ú','u')
        string = string.gsub('í','i')
        string = string.gsub('Í','i')
        string = string.gsub('ý','y')
        string = string.gsub('Ý','y')
        string = string.gsub('ð','d')
        string = string.gsub('Ð','d')
        return string
      end

      def domain_word
        fix_umlauts(Company.name.downcase).split(' ').first.gsub(/\W/,'')
      end

      def domain_suffix
        fetch('internet.domain_suffix')
      end

      def mac_address(prefix='')
        prefix_digits = prefix.split(':').map{ |d| d.to_i(16) }
        address_digits = (6 - prefix_digits.size).times.map{ rand(256) }
        (prefix_digits + address_digits).map{ |d| '%02x' % d }.join(':')
      end

      def ip_v4_address
        ary = (2..254).to_a
        [ary.sample,
        ary.sample,
        ary.sample,
        ary.sample].join('.')
      end

      def ip_v6_address
        @@ip_v6_space ||= (0..65535).to_a
        container = (1..8).map{ |_| @@ip_v6_space.sample }
        container.map{ |n| n.to_s(16) }.join(':')
      end

      def url(host = domain_name, path = "/#{user_name}")
        "http://#{host}#{path}"
      end

      def slug(words = nil, glue = nil)
        glue ||= %w[- _ .].sample
        (words || Faker::Lorem::words(2).join(' ')).gsub(' ', glue).downcase
      end

      def device_token
        rand(16 ** 64).to_s(16).rjust(64, '0').chars.to_a.shuffle.join
      end
    end
  end
end
