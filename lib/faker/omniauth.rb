# class Faker::Internet::Omniauth
#
# end
module Faker
  class Omniauth < Base
    require 'pry'
    require 'time'
    attr_reader :name,
                :first_name,
                :last_name,
                :uid,
                :email

    def initialize
      @name = Name.name
      @first_name = name.split(' ').first
      @last_name = name.split(' ').last
      @uid = Number.number(9)
      @email = "#{first_name.downcase}@example.com"
    end

    def self.google
      auth = Omniauth.new()
      {
        provider: "google_oauth2",
        uid: auth.uid,
        info: {
          name: auth.name,
          first_name: auth.first_name,
          last_name: auth.last_name,
          email: auth.email,
          image: Placeholdit.image
        },
        credentials:  {
          token: Crypto.md5,
          refresh_token: Crypto.md5,
          expires_at: one_hour_from_now.to_i,
          expires: true
        },
        extra: {
          raw_info: {
            sub:  auth.uid,
            email: auth.email,
            email_verified: true,
            name: auth.name,
            given_name: auth.first_name,
            family_name: auth.last_name,
            profile: "https://plus.google.com/#{auth.uid}",
            picture: Placeholdit.image,
            gender: ["male", "female"].shuffle.pop,
            birthday: Date.backward(36400).strftime("%Y-%m-%d"),
            local: "en",
            hd: "#{Company.name.downcase}.com"
          },
        },
        id_info: {
          "iss" => "accounts.google.com",
          "at_hash" => Crypto.md5,
          "email_verified" => "true",
          "sub" => Number.number(28).to_s,
          "azp" => "APP_ID",
          "email" => auth.email,
          "aud" => "APP_ID",
          "iat" => Number.number(10),
          "exp" => one_hour_from_now.to_i.to_s,
          "openid_id" => "https://www.google.com/accounts/o8/id?id=#{auth.uid}"
        }
      }
    end

    private

      def self.one_hour_from_now
        Object::Time.now + (60 * 60)
      end
  end
end
