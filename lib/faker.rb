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
        @locale || I18n.locale
      end
    end
  end
  
  class Base
    class << self
      ## make sure numerify results doesn’t start with a zero
      def numerify(number_string)
        number_string.sub(/#/) { (rand(9)+1).to_s }.gsub(/#/) { rand(10).to_s }
      end
  
      def letterify(letter_string)
        letter_string.gsub(/\?/) { ('A'..'Z').to_a.sample }
      end
  
      def bothify(string)
        letterify(numerify(string))
      end
      
      # Helper for the common approach of grabbing a translation
      # with an array of values and selecting one of them.
      def fetch(key)
        translate("faker.#{key}").sample
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
        opts[:throw] = true
        I18n.translate(*(args.push(opts)))
      rescue
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
