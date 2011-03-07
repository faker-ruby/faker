require 'thor'
require 'faker.rb'

module Faker
  class CLI < Thor


    desc "address", "Returns random data for an address"
    def address(option='')
      option = false
      case option
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
        when 'city_prefix'
          puts Faker::Address.city_prefix
        when 'state_abbr'
          puts Faker::Address.state_abbr
        when 'state'
          puts Faker::Address.state
        when 'country'
          puts Faker::Address.country
        else
          puts 'no option supplied'
      end
    end

    desc "company", "Returns random data for a company"
     method_option :name, :aliases => "-n", :desc => "returns a company name"
    def company(option)
      case option
        when 'name'
          puts Faker::Company.name
        when 'suffix'
          puts Faker::Company.suffix
        when 'catch_phrase'
          puts Faker::Company.catch_phrase
        when 'bs'
          puts Faker::Company.bs
        else
          puts 'no option supplied'
        end
    end

    desc "internet", "Returns random internet data"
    def internet(option)
      case option
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
          puts 'no option supplied'
        end
    end

  end
end
#
