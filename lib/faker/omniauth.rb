# class Faker::Internet::Omniauth
#
# end
module Faker
  class Omniauth < Base
    require 'pry'
    require 'time'
    attr_reader :name,
                :first_name,
                :last_name

    def initialize
      @name = Name.name
      @first_name = name.split(' ').first
      @last_name = name.split(' ').last
    end

    def self.google
      auth = Omniauth.new()
      {
        provider:     "google_oauth2",
        uid:          Number.number(9),
        info:         {
          name:       auth.name,
          first_name: auth.first_name,
          last_name:  auth.last_name,
          email:      "#{auth.first_name.downcase}@example.com",
          image:      Placeholdit.image
        },
        credentials:  {
          token:          Crypto.md5,
          refresh_token:  Crypto.md5,
          expires_at:     one_hour_from_now.to_i,
          expires:        true
        },
        extra:        {
          raw_info:     {
            name: auth.name,
            given_name: auth.first_name,
            family_name: auth.last_name,
            sub: Number.number(9)
          }
        }
      }
    end

    private

      def self.one_hour_from_now
        Object::Time.now + (60 * 60)
      end
  end
end
