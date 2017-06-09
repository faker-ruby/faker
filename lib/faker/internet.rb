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
        [user_name(name), 'example.'+ sample(%w[org com net])].join('@')
      end

      def user_name(specifier = nil, separators = %w(. _))
        with_locale(:en) do
          if specifier.respond_to?(:scan)
            return specifier.scan(/\w+/).shuffle.join(sample(separators)).downcase
          elsif specifier.kind_of?(Integer)
            # If specifier is Integer and has large value, Argument error exception is raised to overcome memory full error
            raise ArgumentError, "Given argument is too large" if specifier > 10**6
            tries = 0 # Don't try forever in case we get something like 1_000_000.
            begin
              result = user_name(nil, separators)
              tries += 1
            end while result.length < specifier && tries < 7
            return result * (specifier/result.length + 1) if specifier > 0
          elsif specifier.kind_of?(Range)
            tries = 0
            begin
              result = user_name(specifier.min, separators)
              tries += 1
            end while !specifier.include?(result.length) && tries < 7
            return result[0...specifier.max]
          end

          sample([
            Char.prepare(Name.first_name),
            [Name.first_name, Name.last_name].map{ |name|
              Char.prepare(name)
            }.join(sample(separators))
          ])
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
            temp[index] = char.upcase if index.even?
          end
        end

        if special_chars
          chars = %w(! @ # $ % ^ & *)
          rand(min_length).times do |i|
            temp[i] = chars[rand(chars.length)]
          end
        end

        temp
      end

      def domain_name
        with_locale(:en) { [Char.prepare(domain_word), domain_suffix].join('.') }
      end

      def fix_umlauts(string='')
        Char.fix_umlauts(string)
      end

      def domain_word
        return Char.prepare(Company.name.split(' ')[1]) if Config.locale == 'uk'
        Char.prepare(Company.name.split(' ').first)
      end

      def domain_suffix
        fetch('internet.domain_suffix')
      end

      def mac_address(prefix='')
        prefix_digits = prefix.split(':').map{ |d| d.to_i(16) }
        address_digits = (6 - prefix_digits.size).times.map{ rand(256) }
        (prefix_digits + address_digits).map{ |d| '%02x' % d }.join(':')
      end

      def ip_v4_address(type=:decimal)
        bin_address = rand(0..0xffffffff) # rand int that will be in the range 0.0.0.0-255.255.255
        case type
          when :binary, 'binary'
            return bin_address
          else
            return uint_to_ip(bin_address)
        end
      end

      def private_ip_v4_address
        begin
          addr = ip_v4_address(:binary)
        end while !private_net_checker[addr]
        uint_to_ip(addr)
      end

      def public_ip_v4_address
        begin
          addr = ip_v4_address(:binary)
        end while reserved_net_checker[addr]
        uint_to_ip(addr)
      end

      def private_nets_regex
        [
            /^1010\d{24}$/,                        #10.0.0.0/8
            /^110010001\d{22}$/,                   #100.64.0.0/10
            /^101011000001\d{20}$/,                #172.16.0.0/12
            /^110000000000000000000000\d{8}$/,     #192.0.0.0/24
            /^1100000010101000\d{16}$/,            #192.168.0.0/16
            /^110001100001001\d{17}$/              #198.18.0.0/15 -> [198.to_s(2)+'000' + 18.to_s(2)]
        ]
      end

      def reserved_nets_regex
        [
            /^\d{,24}$/,                            #0.0.0.0/8
            /^1111111\d{24}$/,                     #127.0.0.0/8
            /^1010100111111110\d{16}$/,            #169.254.0.0/16
            /^110000000000000000000010\d{8}$/,     #192.0.2.0/24
            /^110000000101100001100011\d{8}$/,     #192.88.99.0/24
            /^11000000001100110{8}\d{8}$/,         #198.51.100.0/24
            /^110010110000000001110001\d{8}$/,     #203.0.113.0/24
            /^1110\d{28}$/,                        #224.0.0.0/4
            /^1111\d{28}$/                         #240.0.0.0/4, #255.255.255.255
        ]
      end

      def private_net_checker
        lambda { |addr| private_nets_regex.any? { |net| net =~ addr.to_s(2) } }
      end

      def reserved_net_checker
        ->(addr){ (private_nets_regex + reserved_nets_regex).any? { |net| net =~ addr.to_s(2) } }
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
        glue ||= sample(%w[- _ .])
        (words || Faker::Lorem::words(2).join(' ')).gsub(' ', glue).downcase
      end

      def device_token
        shuffle(rand(16 ** 64).to_s(16).rjust(64, '0').chars.to_a).join
      end

      def user_agent(vendor = nil)
        agent_hash = translate('faker.internet.user_agent')
        agents = vendor.respond_to?(:to_sym) && agent_hash[vendor.to_sym] || agent_hash[sample(agent_hash.keys)]
        sample(agents)
      end

      # copy from https://github.com/ipaddress-gem/ipaddress/blob/master/lib/ipaddress.rb
      def uint_to_ip(uint)
        unless(uint.is_a? Numeric and uint <= 0xffffffff and uint >= 0)
          raise(::ArgumentError, "not a long integer: #{uint.inspect}")
        end
        ret = []
        4.times do
          ret.unshift(uint & 0xff)
          uint >>= 8
        end
        ret.join('.')
      end
    end
  end
end
