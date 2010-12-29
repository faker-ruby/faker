$:.unshift mydir = File.dirname(__FILE__)

require 'i18n'
I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
I18n.load_path += Dir[File.join(mydir, 'locales', '*.yml')]


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
        letter_string.gsub(/\?/) { ('a'..'z').to_a.rand }
      end
  
      def bothify(string)
        letterify(numerify(string))
      end
      
      # Helper for the common approach of grabbing a translation with an array
      # of values and selecting one of them
      def fetch(key)
        I18n.translate("faker.#{key}").rand
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
