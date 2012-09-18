require 'test/unit'
require 'rubygems'
require 'yaml'
YAML::ENGINE.yamler = 'syck' if defined? YAML::ENGINE
require File.expand_path(File.dirname(__FILE__) + '/../lib/faker')
