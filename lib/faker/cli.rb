require 'thor'
require 'faker.rb'

module Faker
  class CLI < Thor

    desc "address [-f street_name|street_address|secondary_address|zip_code|street_suffix|city_suffix|state_abbr|state|country]", 
    "Returns fake address data"
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
          puts "Run `faker help address` for a list of valid types"
      end
    end

    desc "company [-f name|suffix|catch_phrase|bs]",
    "Returns fake company data"
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
          puts "Run `faker help company` for a list of valid types"
      end
    end

    desc "internet [-f email|free_email|user_name|domain_name|ip_v4_address|ip_v6_address]",
    "Returns fake internet data"
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
          puts "Run `faker help internet` for a list of valid types"
      end
    end

    desc "lorum [-f words|sentence|sentences|paragraph|paragraphs -c 5]",
    "Returns fake lorum data"
    method_option :faker_type, :aliases => "-f", :desc => "the faker data type"
    method_option :number, :type => :numeric, :aliases => "-n", :desc => "the number to return" 
    def lorum
      case options.faker_type
        when 'words'
          puts options.number ? Faker::Lorem.words(options.number) : Faker::Lorem.words
        when 'sentence'
          puts options.number ? Faker::Lorem.sentence(options.number) : Faker::Lorem.sentence
        when 'sentences'
          puts options.number ? Faker::Lorem.sentences(options.number) : Faker::Lorem.sentences
        when 'paragraph'
          puts options.number ? Faker::Lorem.paragraph(options.number) : Faker::Lorem.paragraph
        when 'paragraphs'
          puts options.number ? Faker::Lorem.paragraphs(options.number) : Faker::Lorem.paragraphs
        else
          puts "Usage: `faker lorum -f words -n 5`"
          puts "Run `faker help lorum` for a list of valid types"
      end
    end

    desc "name [-f name|first_name|last_name|prefix|suffix]",
    "Returns fake name data"
    method_option :faker_type, :aliases => "-f", :desc => "the faker data type"
    def name
      case options.faker_type
        when 'name'
          puts Faker::Name.name
        when 'first_name'
          puts Faker::Name.first_name
        when 'last_name'
          puts Faker::Name.last_name
        when 'prefix'
          puts Faker::Name.prefix
        when 'suffix'
          puts Faker::Name.suffix
        else
          puts "Usage: `faker name -f name`"
          puts "Run `faker help name` for a list of valid types"
      end
    end

    desc "phone_number",
    "Returns fake phone number data"
    def phone_number
        puts Faker::PhoneNumber.phone_number
    end
  end
end
#
