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
            result = user_name
            tries += 1
          end while result.length < specifier and tries < 7
          until result.length >= specifier
            result = result * 2
          end
          return result
        elsif specifier.kind_of? Range
          tries = 0
          begin
            result = user_name specifier.min
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

      def password
        Lorem.words.join
      end

      def domain_name
        [ fix_umlauts(domain_word), domain_suffix ].join('.')
      end

      def fix_umlauts(string)
        string.gsub(/[äöüß]/i) do |match|
            case match.downcase
                when "ä" 'ae'
                when "ö" 'oe'
                when "ü" 'ue'
                when "ß" 'ss'
            end
        end
      end

      def domain_word
        Company.name.split(' ').first.gsub(/\W/, '').downcase
      end

      def domain_suffix
        fetch('internet.domain_suffix')
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

      def url
        "http://#{domain_name}/#{user_name}"
      end

      def slug(words = nil, glue = nil)
        glue ||= %w[- _ .].sample
        (words || Faker::Lorem::words(2).join(' ')).gsub(' ', glue).downcase
      end
    end
  end
end
