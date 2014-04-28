module Faker
  class Company < Base
    flexible :company

    class << self
      def name(opts = {})
        max_length = opts.fetch(:max_length, Float::INFINITY)
        max_tries = opts.fetch(:max_tries, 7)
        tries = 0
        begin
          res = parse('company.name')
          tries += 1
        end while res.length > max_length and tries < max_tries
        raise "Unable to match criteria within try limit (#{max_tries})" if tries >= max_tries
        return res
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

      def duns_number
        ('%09d' % rand(10 ** 9)).gsub(/(\d\d)(\d\d\d)(\d\d\d\d)/, '\\1-\\2-\\3')
      end
    end

  end
end
