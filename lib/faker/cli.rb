# frozen_string_literal: true

require 'thor'

module Faker
  class CLI < Thor
    Faker.constants.sort.each do |constant|
      desc "#{constant.downcase} [-f #{Faker::Base.module_methods(constant).join('|')}]",
           "Returns fake #{constant.downcase} data"
      option :faker_type, aliases: '-f', desc: 'the faker data type'

      define_method :"#{constant.downcase}" do
        begin
          puts Object.const_get("Faker::#{constant.capitalize}.#{options.faker_type}")
        rescue I18n::MissingTranslationData
          puts 'Usage: `faker address -f=street_address`'
          puts 'Run `faker help address` for a list of valid types'
        end
      end
    end
  end
end
