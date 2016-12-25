# encoding: utf-8
module Faker
  class Internet < Base
    class << self
      def email(name = nil)
        [user_name(name), domain_name].join('@')
      end

      def free_email(name = nil)
        [user_name(name), fetch('internet.free_email')].join('@')
      end

      def safe_email(name = nil)
        [user_name(name), 'example.'+ %w[org com net].shuffle.first].join('@')
      end

      def user_name(specifier = nil, separators = %w(. _))
        with_locale(:en) do
          if specifier.kind_of? String
            return specifier.scan(/\w+/).shuffle.join(separators.sample).downcase
          elsif specifier.kind_of? Integer
            # If specifier is Integer and has large value, Argument error exception is raised to overcome memory full error 
            raise ArgumentError, "Given argument is too large" if specifier > 10**6
            tries = 0 # Don't try forever in case we get something like 1_000_000.
            begin
              result = user_name nil, separators
              tries += 1
            end while result.length < specifier and tries < 7
            result = result * (specifier/result.length + 1) if specifier > 0
            return result
          elsif specifier.kind_of? Range
            tries = 0
            begin
              result = user_name specifier.min, separators
              tries += 1
            end while not specifier.include? result.length and tries < 7
            return result[0...specifier.max]
          end

          [
            Char.prepare(Name.first_name),
            [Name.first_name, Name.last_name].map{ |name|
              Char.prepare name
            }.join(separators.sample)
          ].sample
        end
      end

      def password(min_length = 8, max_length = 16, mix_case = true, special_chars = false)
        temp = Lorem.characters(min_length)
        diff_length = max_length - min_length
        if diff_length > 0
          diff_rand = rand(diff_length + 1)
          temp += Lorem.characters(diff_rand)
        end

        if mix_case
          temp.chars.each_with_index do |char, index|
            temp[index] = char.upcase if index % 2 == 0
          end
        end

        if special_chars
          chars = %w(! @ # $ % ^ & *)
          Random.rand(min_length).times do |i|
            temp[i] = chars[Random.rand(chars.length)]
          end
        end

        return temp
      end

      def domain_name
        with_locale(:en) { [Char.prepare(domain_word), domain_suffix].join('.') }
      end

      def fix_umlauts(string)
        Char.fix_umlauts string
      end

      def domain_word
        if %w(uk).include? Config.locale
          return Char.prepare Company.name.split(' ')[1]
        end
        Char.prepare Company.name.split(' ').first
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
        (1..4).map { rand(2..254) }.join('.')
      end

      def private_ip_v4_address
        is_private = private_net_checker
        addr = nil
        begin
          addr = ip_v4_address
        end while !is_private[addr]
        addr
      end

      def public_ip_v4_address
        is_private = private_net_checker
        addr = nil
        begin
          addr = ip_v4_address
        end while is_private[addr]
        addr
      end

      def private_nets_regex
        [
          /^10\./,
          /^127\./,
          /^169\.254\./,
          /^172\.(16|17|18|19|2\d|30|31)\./,
          /^192\.168\./
        ]
      end

      def private_net_checker
        lambda { |addr| private_nets_regex.any? { |net| net =~ addr } }
      end

      def ip_v4_cidr
        "#{ip_v4_address}/#{1 + rand(31)}"
      end

      def ip_v6_address
        (1..8).map { rand(65536).to_s(16) }.join(':')
      end

      def ip_v6_cidr
        "#{ip_v6_address}/#{1 + rand(127)}"
      end

      def url(host = domain_name, path = "/#{user_name}", scheme = 'http')
        "#{scheme}://#{host}#{path}"
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
