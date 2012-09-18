mydir = File.expand_path(File.dirname(__FILE__))

begin
  require 'psych'
rescue LoadError
end

require 'i18n'
I18n.load_path += Dir[File.join(mydir, 'locales', '*.yml')]
I18n.reload!


module Faker
  class Config
    @locale = nil

    class << self
      attr_writer :locale
      def locale
        @locale || I18n.locale.downcase
      end
    end
  end

  class Base
    Numbers = Array(0..9)
    ULetters = Array('A'..'Z')
    Letters = ULetters + Array('a'..'z')

    class << self
      ## make sure numerify results doesn’t start with a zero
      def numerify(number_string)
        number_string.sub(/#/) { (rand(9)+1).to_s }.gsub(/#/) { rand(10).to_s }
      end

      def letterify(letter_string)
        letter_string.gsub(/\?/) { ULetters.sample }
      end

      def bothify(string)
        letterify(numerify(string))
      end

      # Given a regular expression, attempt to generate a string
      # that would match it.  This is a rather simple implementation,
      # so don't be shocked if it blows up on you in a spectacular fashion.
      #
      # It does not handle ., *, unbounded ranges such as {1,},
      # extensions such as (?=), character classes, some abbreviations
      # for character classes, and nested parentheses.
      #
      # I told you it was simple. :) It's also probably dog-slow,
      # so you shouldn't use it.
      #
      # It will take a regex like this:
      #
      # /^[A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}$/
      #
      # and generate a string like this:
      #
      # "U3V  3TP"
      #
      def regexify(re)
        re = re.source if re.respond_to?(:source) # Handle either a Regexp or a String that looks like a Regexp
        re.
          gsub(/^\/?\^?/, '').gsub(/\$?\/?$/, '').                                                                      # Ditch the anchors
          gsub(/\{(\d+)\}/, '{\1,\1}').gsub(/\?/, '{0,1}').                                                             # All {2} become {2,2} and ? become {0,1}
          gsub(/(\[[^\]]+\])\{(\d+),(\d+)\}/) {|match| $1 * Array(Range.new($2.to_i, $3.to_i)).sample }.                # [12]{1,2} becomes [12] or [12][12]
          gsub(/(\([^\)]+\))\{(\d+),(\d+)\}/) {|match| $1 * Array(Range.new($2.to_i, $3.to_i)).sample }.                # (12|34){1,2} becomes (12|34) or (12|34)(12|34)
          gsub(/(\\?.)\{(\d+),(\d+)\}/) {|match| $1 * Array(Range.new($2.to_i, $3.to_i)).sample }.                      # A{1,2} becomes A or AA or \d{3} becomes \d\d\d
          gsub(/\((.*?)\)/) {|match| match.gsub(/[\(\)]/, '').split('|').sample }.                                      # (this|that) becomes 'this' or 'that'
          gsub(/\[([^\]]+)\]/) {|match| match.gsub(/(\w\-\w)/) {|range| Array(Range.new(*range.split('-'))).sample } }. # All A-Z inside of [] become C (or X, or whatever)
          gsub(/\[([^\]]+)\]/) {|match| $1.split('').sample }.                                                          # All [ABC] become B (or A or C)
          gsub('\d') {|match| Numbers.sample }.
          gsub('\w') {|match| Letters.sample }
      end

      # Helper for the common approach of grabbing a translation
      # with an array of values and selecting one of them.
      def fetch(key)
        fetched = translate("faker.#{key}")
        fetched = fetched.sample if fetched.respond_to?(:sample)
        if fetched.match(/^\//) and fetched.match(/\/$/) # A regex
          regexify(fetched)
        else
          fetched
        end
      end

      # Load formatted strings from the locale, "parsing" them
      # into method calls that can be used to generate a
      # formatted translation: e.g., "#{first_name} #{last_name}".
      def parse(key)
        fetch(key).scan(/#\{([A-Za-z]+\.)?([^\}]+)\}([^#]+)?/).map {|kls, meth, etc|
          # If the token had a class Prefix (e.g., Name.first_name)
          # grab the constant, otherwise use self
          cls = kls ? Faker.const_get(kls.chop) : self

          # If the class has the method, call it, otherwise
          # fetch the transation (i.e., faker.name.first_name)
          text = cls.respond_to?(meth) ? cls.send(meth) : fetch("#{(kls || self).to_s.split('::').last.downcase}.#{meth.downcase}")

          # And tack on spaces, commas, etc. left over in the string
          text += etc.to_s
        }.join
      end

      # Call I18n.translate with our configured locale if no
      # locale is specified
      def translate(*args)
        opts = args.last.is_a?(Hash) ? args.pop : {}
        opts[:locale] ||= Faker::Config.locale
        opts[:raise] = true
        I18n.translate(*(args.push(opts)))
      rescue I18n::MissingTranslationData => e
        # Super-simple fallback -- fallback to en if the
        # translation was missing.  If the translation isn't
        # in en either, then it will raise again.
        I18n.translate(*(args.push(opts.merge(:locale => :en))))
      end

      def flexible(key)
        @flexible_key = key
      end

      # You can add whatever you want to the locale file, and it will get caught here.
      # E.g., in your locale file, create a
      #   name:
      #     girls_name: ["Alice", "Cheryl", "Tatiana"]
      # Then you can call Faker::Name.girls_name and it will act like #first_name
      def method_missing(m, *args, &block)
        super unless @flexible_key

        # Use the alternate form of translate to get a nil rather than a "missing translation" string
        if translation = translate(:faker)[@flexible_key][m]
          translation.respond_to?(:sample) ? translation.sample : translation
        else
          super
        end
      end

    end
  end
end

require 'faker/address'
require 'faker/company'
require 'faker/internet'
require 'faker/lorem'
require 'faker/name'
require 'faker/phone_number'
require 'faker/version'

require 'extensions/array'
require 'extensions/symbol'
