mydir = File.expand_path(File.dirname(__FILE__))

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
        letter_string.gsub(/\?/) { ('a'..'z').to_a.sample }
      end
  
      def bothify(string)
        letterify(numerify(string))
      end
      
      # Helper for the common approach of grabbing a translation with an array
      # of values and selecting one of them
      def fetch(key)
        I18n.translate("faker.#{key}", :locale => Faker::Config.locale).sample
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
require 'faker/bork'

require 'extensions/array'
