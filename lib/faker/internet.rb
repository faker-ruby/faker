# encoding: utf-8
module Faker
  class Internet < Base
    class << self
      @@tld_list = ['asia', 'be', 'biz', 'bz', 'ca', 'cc', 'co', 'com', 'es', 'in', 'info', 'it', 'me',
                    'mobi', 'name', 'net', 'nl', 'org', 'pro', 'tel', 'tv', 'tw', 'us', 'ws', 'xxx', 'com.au',
                    'com.br', 'uk', 'vc', 'at', 'de', 'desi', 'aero', 'example', 'sexy', 'mm-example', 'ruhr',
                    'dance', 'nu', 'global', 'tokyo', 'nyc', 'xyz', 'scot', 'quebec', 'cymru']
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
        temp = temp[0..min_length] if min_length > 0

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


      def domain(options = {})
        length = 20
        tld = get_domain_tld(options)
        if tld.eql?('name')
          domain_prefix = options.key?(:prefix) ? options[:prefix] : 'nametld'
        else
          domain_prefix = options.key?(:prefix) ? options[:prefix] + '-' : ''
        end
        length = options[:length] if options.key?(:length)

        if options.key?(:format)
          case options[:format]
            # when 'timestamp', 'time' , 'time-stamp'
            #   d_name =
            when 'word', 'name', :word, :name
              d_name = Lorem.word
            when :idn, 'idn'
              if options.key?(:prefix)
                domain_prefix = options[:prefix]
                d_name = Number.number(20)[0..(length - domain_prefix.size)]
              elsif options.key?(:language)
                domain_prefix = domain_word(language: options[:language] )
                d_name = DateTime.now.to_i.to_s[0..(length - domain_prefix.size)]
              else
                puts 'In order to generate IDN domain, "language" or "prefix" option must be provided'
                fail
              end
          end
        else

        end
        d_name = Digest::MD5.hexdigest(DateTime.now.to_f.to_s + rand.to_s)[0..(length - domain_prefix.size)] unless d_name
        tld.eql?('name') ? "#{domain_prefix}.#{d_name}.#{tld}" : "#{domain_prefix}#{d_name}.#{tld}"
      end

      def fix_umlauts(string)
        Char.fix_umlauts string
      end

      def domain_word(options = {:charset => 'en'})
        if options.key?(:language)
          current_local = Faker::Config.locale unless options[:language].eql?(Faker::Config.locale)
        end
        Faker::Config.locale = options[:language] if current_local

        if %w(uk ru).include? Config.locale
          word = Company.name.split(' ')[1]
        else
          word =  Company.name.split(' ').first
        end

        if options[:charset].eql?('en')
          word = Char.prepare word
          # elsif charset.eql?('local')
        end
        Faker::Config.locale = current_local if current_local
        word
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
        uint_to_ip rand(0..0xffffffff) # rand int that will be in the range 0.0.0.0-255.255.255
      end

      def private_ip_v4_address
        is_private = private_net_checker
        addr = nil
        begin
          addr = not_reserved_ipv4
        end while !is_private[addr]
        puts is_private[addr]
        uint_to_ip(addr)
      end

      def public_ip_v4_address
        is_private = private_net_checker
        addr = nil
        begin
          addr = not_reserved_ipv4
        end while is_private[addr]
        puts is_private[addr]
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
            /^1111111\d{24}$/,                     #127.0.0.0/8
            /^1010100111111110\d{16}$/,            #169.254.0.0/16
            /^110000000000000000000010\d{8}$/,     #192.0.2.0/24
            /^11000000001100110{8}\d{8}$/,         #198.51.100.0/24
            /^110010110000000001110001\d{8}$/,     #203.0.113.0/24
            /^1110\d{28}$/,                        #224.0.0.0/4
            /^1111\d{28}$/                         #240.0.0.0/4
        ]
      end

      def private_net_checker
        lambda { |addr| private_nets_regex.any? { |net| net =~ addr.to_s(2) } }
      end

      def reserved_net_checker
        lambda { |addr| reserved_nets_regex.any? { |net| net =~ addr.to_s(2) } }
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


      def ip_v4_cidr
        "#{ip_v4_address}/#{1 + rand(31)}"
      end

      def ip_v6_address
        @@ip_v6_space ||= (0..65535).to_a
        container = (1..8).map{ |_| @@ip_v6_space.sample }
        container.map{ |n| n.to_s(16) }.join(':')
      end

      def ip_v6_cidr
        "#{ip_v6_address}/#{1 + rand(127)}"
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

      private

      def not_reserved_ipv4
        is_reserved = reserved_net_checker
        addr = nil
        begin
          addr = rand(0x1000000..0xfffffffe) # rand int that will be in the range 1.0.0.0-255.255.255
        end while is_reserved[addr]
        addr
      end

      def get_domain_tld(options)
        if options.key?(:tld)
          tld = options[:tld]
        elsif options.key?(:gtld)
          tld = options[:gtld]
          if options.key?(:cctld)
            tld << '.' + options[:cctld]
          end
        elsif options.key?(:cctld)
          tld = options[:cctld]
        else
          tld = @@tld_list.sample
        end
        tld
      end
    end
  end
end
