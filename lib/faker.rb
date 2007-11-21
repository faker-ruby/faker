$:.unshift File.dirname(__FILE__)

require 'faker/name'
require 'faker/phone_number'
require 'faker/company'
require 'faker/address'

require 'extensions/array'

module Faker
  def self.numerify(number_string)
    number_string.gsub(/#/) { rand(10).to_s }
  end
end