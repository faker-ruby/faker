mydir = File.dirname(__FILE__)

begin
  require 'psych'
rescue LoadError
end

require 'i18n'
I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
I18n.load_path += Dir[File.join(mydir, 'locales', '*.yml')]
I18n.reload!


module Faker
  class Config
    def self.locale=(locale)
      I18n.locale = locale
    end
  end
  
  class Base
    class << self
      def numerify(number_string)
        number_string.gsub(/#/) { rand(10).to_s }
      end
  
      def letterify(letter_string)
        letter_string.gsub(/\?/) { ('A'..'Z').to_a.rand }
      end
  
      def bothify(string)
        letterify(numerify(string))
      end
      
      # Helper for the common approach of grabbing a translation with an array
      # of values and selecting one of them
      def fetch(key)
        I18n.translate("faker.#{key}").rand
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
        if translation = I18n.translate(:faker)[@flexible_key][m]
          translation.respond_to?(:rand) ? translation.rand : translation
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
