# frozen_string_literal: true

module Faker
  class Internet < Base
    class << self
      def email(name: nil, separators: nil)
        if separators
          [username(specifier: name, separators: separators), domain_name].join('@')
        else
          [username(specifier: name), domain_name].join('@')
        end
      end

      def free_email(name: nil)
        [username(specifier: name), fetch('internet.free_email')].join('@')
      end

      def safe_email(name: nil)
        [username(specifier: name), 'example.' + sample(%w[org com net])].join('@')
      end

      def username(specifier: nil, separators: %w[. _])
        with_locale(:en) do
          return shuffle(specifier.scan(/[[:word:]]+/)).join(sample(separators)).downcase if specifier.respond_to?(:scan)

          if specifier.is_a?(Integer)
            # If specifier is Integer and has large value, Argument error exception is raised to overcome memory full error
            raise ArgumentError, 'Given argument is too large' if specifier > 10**6

            tries = 0 # Don't try forever in case we get something like 1_000_000.
            result = nil
            loop do
              result = username(specifier: nil, separators: separators)
              tries += 1
              break unless result.length < specifier && tries < 7
            end
            return result * (specifier / result.length + 1) if specifier.positive?
          elsif specifier.is_a?(Range)
            tries = 0
            result = nil
            loop do
              result = username(specifier: specifier.min, separators: separators)
              tries += 1
              break unless !specifier.include?(result.length) && tries < 7
            end
            return result[0...specifier.max]
          end

          sample([
                   Char.prepare(Name.first_name),
                   [Name.first_name, Name.last_name].map do |name|
                     Char.prepare(name)
                   end.join(sample(separators))
                 ])
        end
      end

      def password(min_length: 8, max_length: 16, mix_case: true, special_characters: false)
        temp = Lorem.characters(number: min_length)
        diff_length = max_length - min_length

        if diff_length.positive?
          diff_rand = rand(diff_length + 1)
          temp += Lorem.characters(number: diff_rand)
        end

        if mix_case
          temp.chars.each_with_index do |char, index|
            temp[index] = char.upcase if index.even?
          end
        end

        if special_characters
          chars = %w[! @ # $ % ^ & *]
          rand(1..min_length).times do |i|
            temp[i] = chars[rand(chars.length)]
          end
        end

        temp
      end

      def domain_name(subdomain: false)
        with_locale(:en) do
          domain_elements = [Char.prepare(domain_word), domain_suffix]
          domain_elements.unshift(Char.prepare(domain_word)) if subdomain
          domain_elements.join('.')
        end
      end

      def fix_umlauts(string: '')
        Char.fix_umlauts(string)
      end

      def domain_word
        with_locale(:en) { Char.prepare(Company.name.split(' ').first) }
      end

      def domain_suffix
        fetch('internet.domain_suffix')
      end

      def mac_address(prefix: '')
        prefix_digits = prefix.split(':').map { |d| d.to_i(16) }
        address_digits = Array.new((6 - prefix_digits.size)) { rand(256) }
        (prefix_digits + address_digits).map { |d| format('%02x', d) }.join(':')
      end

      def ip_v4_address
        [rand_in_range(0, 255), rand_in_range(0, 255),
         rand_in_range(0, 255), rand_in_range(0, 255)].join('.')
      end

      def private_ip_v4_address
        addr = nil
        loop do
          addr = ip_v4_address
          break if private_net_checker[addr]
        end
        addr
      end

      def public_ip_v4_address
        addr = nil
        loop do
          addr = ip_v4_address
          break unless reserved_net_checker[addr]
        end
        addr
      end

      def private_nets_regex
        [
          /^10\./,                                       # 10.0.0.0    - 10.255.255.255
          /^100\.(6[4-9]|[7-9]\d|1[0-1]\d|12[0-7])\./,   # 100.64.0.0  - 100.127.255.255
          /^127\./,                                      # 127.0.0.0   - 127.255.255.255
          /^169\.254\./,                                 # 169.254.0.0 - 169.254.255.255
          /^172\.(1[6-9]|2\d|3[0-1])\./,                 # 172.16.0.0  - 172.31.255.255
          /^192\.0\.0\./,                                # 192.0.0.0   - 192.0.0.255
          /^192\.168\./,                                 # 192.168.0.0 - 192.168.255.255
          /^198\.(1[8-9])\./                             # 198.18.0.0  - 198.19.255.255
        ]
      end

      def private_net_checker
        ->(addr) { private_nets_regex.any? { |net| net =~ addr } }
      end

      def reserved_nets_regex
        [
          /^0\./,                 # 0.0.0.0      - 0.255.255.255
          /^192\.0\.2\./,         # 192.0.2.0    - 192.0.2.255
          /^192\.88\.99\./,       # 192.88.99.0  - 192.88.99.255
          /^198\.51\.100\./,      # 198.51.100.0 - 198.51.100.255
          /^203\.0\.113\./,       # 203.0.113.0  - 203.0.113.255
          /^(22[4-9]|23\d)\./,    # 224.0.0.0    - 239.255.255.255
          /^(24\d|25[0-5])\./     # 240.0.0.0    - 255.255.255.254  and  255.255.255.255
        ]
      end

      def reserved_net_checker
        ->(addr) { (private_nets_regex + reserved_nets_regex).any? { |net| net =~ addr } }
      end

      def ip_v4_cidr
        "#{ip_v4_address}/#{rand(1..31)}"
      end

      def ip_v6_address
        (1..8).map { rand(65_536).to_s(16) }.join(':')
      end

      def ip_v6_cidr
        "#{ip_v6_address}/#{rand(1..127)}"
      end

      def url(host: domain_name, path: "/#{username}", scheme: 'http')
        "#{scheme}://#{host}#{path}"
      end

      def slug(words: nil, glue: nil)
        glue ||= sample(%w[- _])
        (words || Faker::Lorem.words(number: 2).join(' ')).delete(',.').gsub(' ', glue).downcase
      end

      def device_token
        shuffle(rand(16**64).to_s(16).rjust(64, '0').chars.to_a).join
      end

      def user_agent(vendor: nil)
        agent_hash = translate('faker.internet.user_agent')
        agents = vendor.respond_to?(:to_sym) && agent_hash[vendor.to_sym] || agent_hash[sample(agent_hash.keys)]
        sample(agents)
      end

      def uuid
        # borrowed from: https://github.com/ruby/ruby/blob/d48783bb0236db505fe1205d1d9822309de53a36/lib/securerandom.rb#L250
        ary = Faker::Config.random.bytes(16).unpack('NnnnnN')
        ary[2] = (ary[2] & 0x0fff) | 0x4000
        ary[3] = (ary[3] & 0x3fff) | 0x8000
        '%08x-%04x-%04x-%04x-%04x%08x' % ary # rubocop:disable Style/FormatString
      end

      alias user_name username
    end
  end
end
