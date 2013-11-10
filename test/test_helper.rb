require 'test/unit'
require 'rubygems'
require 'yaml'
YAML::ENGINE.yamler = 'syck' if defined? YAML::ENGINE
require File.expand_path(File.dirname(__FILE__) + '/../lib/faker')

def assert_each_element_matches_regex(list, regex)
	list.each do | elem |
		assert_match(regex, elem)
	end
end