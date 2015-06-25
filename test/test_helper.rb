require 'test/unit'
require 'rubygems'
require 'yaml'
YAML::ENGINE.yamler = 'syck' if defined? YAML::ENGINE
require File.expand_path(File.dirname(__FILE__) + '/../lib/faker')

# configure I18n
locales_path = File.expand_path(File.dirname(__FILE__) + '../lib/locales')
I18n.available_locales = Dir[locales_path + '/*'].map do |file|
  file.split('.').first
end

# changed to false to allow the tests to run
# see: https://github.com/rails/rails/issues/13164
I18n.enforce_available_locales = false
