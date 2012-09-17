require 'test/unit'
require 'rubygems'
require 'yaml'
YAML::ENGINE.yamler = 'syck'
require File.expand_path(File.dirname(__FILE__) + '/../lib/faker')
