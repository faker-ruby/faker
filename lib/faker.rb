$:.unshift mydir = File.dirname(__FILE__)

require 'i18n'
I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
I18n.load_path = Dir[File.join(mydir, 'locales', '*.yml')]
I18n.default_locale = "en-us"

require 'faker/address'
require 'faker/company'
require 'faker/internet'
require 'faker/lorem'
require 'faker/name'
require 'faker/phone_number'
require 'faker/version'

require 'extensions/array'


module Faker
  class Config
    def self.locale=(locale)
      I18n.locale = locale
    end
  end
  
  def self.numerify(number_string)
    number_string.gsub(/#/) { rand(10).to_s }
  end
  
  def self.letterify(letter_string)
    letter_string.gsub(/\?/) { ('a'..'z').to_a.rand }
  end
  
  def self.bothify(string)
    self.letterify(self.numerify(string))
  end
end