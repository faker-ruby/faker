# class Faker::Internet::Omniauth
#
# end
module Faker
  class Omniauth < Base
    require 'pry'
    attr_reader :name

    def initialize
      @name = Name.name
      @first_name = name.split(' ').first
      @last_name = name.split(' ').last
    end

    def self.google
      auth = Omniauth.new()
      
    end
  end
end
