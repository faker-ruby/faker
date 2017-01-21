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
      @name = "#{Name.first_name} #{Name.last_name}"
      @first_name = name.split(' ').first
      @last_name = name.split(' ').last
      @uid = Number.number(9)
      @email = "#{first_name.downcase}@example.com"
      @facebook_uid = Number.number(7)
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

    def self.facebook
      uid = Number.number(7)
      auth = Omniauth.new()
      username = "#{auth.first_name.downcase[0]}#{auth.last_name.downcase}"
      email = "#{auth.first_name.downcase}@#{auth.last_name.downcase}.com"
      {
        provider: "facebook",
        uid: uid,
        info: {
          email: email,
          name: auth.name,
          first_name: auth.first_name,
          last_name: auth.last_name,
          image: Placeholdit.image,
          verified: true
        },
        credentials: {
          token: Crypto.md5,
          expires_at: one_hour_from_now.to_i,
          expires: true
        },
        extra: {
          raw_info: {
            id: uid,
            name: auth.name,
            first_name: auth.first_name,
            last_name: auth.last_name,
            link: "http://www.facebook.com/#{username}",
            username: username,
            location: {
              id: Number.number(9),
              name: "#{Address.city}, #{Address.state}"
            },
            gender: gender,
            email: email,
            timezone: timezone,
            locale: 'en_US',
            verified: true,
            updated_time: updated_time
          }
        }
      }
    end

    private

      def self.one_hour_from_now
        Object::Time.now + (60 * 60)
      end

      def self.gender
        ["male", "female"].shuffle.pop
      end

      def self.timezone
        [-12, -11, -10, -9.5, -9, -8, -7, -6, -5, -4 -3.5, -3, -2, -1, 0, 1, 2,
          3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 8, 8.5, 8.75, 9, 9.5, 10, 10.5, 11,
        12].shuffle.pop
      end

      def self.updated_time
        time = Object::Time.now.to_s.split(' ')
        "#{Date.backward(365).to_s}T#{time[1]}#{time[2]}"
      end
  end
end
