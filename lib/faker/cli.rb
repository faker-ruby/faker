require 'thor'
require 'faker.rb'

module Faker
  class CLI < Thor

    desc "address [-f street_name|street_address|secondary_address|zip_code|street_suffix|city_suffix|state_abbr|state|country]", 
    "Fake address data"
    method_option :faker_type, :aliases => "-f", :desc => "the faker data type"
    def address
      case options.faker_type
        when 'street_name'
          puts Faker::Address.street_name
        when 'street_address'
          puts Faker::Address.street_address
        when 'secondary_address'
          puts Faker::Address.secondary_address
        when 'zip_code'
          puts Faker::Address.zip_code
        when 'street_suffix'
          puts Faker::Address.street_suffix
        when 'city_suffix'
          puts Faker::Address.city_suffix
        when 'state_abbr'
          puts Faker::Address.state_abbr
        when 'state'
          puts Faker::Address.state
        when 'country'
          puts Faker::Address.country
        else
          puts "Usage: `faker address -f=street_address`"
          puts "Run `faker address --help` for a list of valid types"
      end
    end

    desc "company [-f name|suffix|catch_phrase|bs]",
    "Fake company data"
    method_option :faker_type, :aliases => "-f", :desc => "the faker data type"
    def company
      case options.faker_type
        when 'name'
          puts Faker::Company.name
        when 'suffix'
          puts Faker::Company.suffix
        when 'catch_phrase'
          puts Faker::Company.catch_phrase
        when 'bs'
          puts Faker::Company.bs
        else
          puts "Usage: `faker company -f=name`"
          puts "Run `faker company --help` for a list of valid types"
        end
    end

    desc "internet [-f email|free_email|user_name|domain_name|ip_v4_address|ip_v6_address]",
    "Fake internet data"
    method_option :faker_type, :aliases => "-f", :desc => "the faker data type"
    def internet
      case options.faker_type
        when 'email'
          puts Faker::Internet.email
        when 'free_email'
          puts Faker::Internet.free_email
        when 'user_name'
          puts Faker::Internet.user_name
        when 'domain_name'
          puts Faker::Internet.domain_name
        when 'domain_word'
          puts Faker::Internet.domain_word
        when 'domain_suffix'
          puts Faker::Internet.domain_suffix
        when 'ip_v4_address'
          puts Faker::Internet.ip_v4_address
        when 'ip_v6_address'
          puts Faker::Internet.ip_v6_address
        else
          puts "Usage: `faker internet -f=email`"
          puts "Run `faker internet --help` for a list of valid types"
        end
    end

  end
end
#
