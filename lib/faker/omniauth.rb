module Faker
  class Omniauth < Base
    require 'pry'
    require 'time'
    attr_reader :name,
                :first_name,
                :last_name

    def initialize
      @name = "#{Name.first_name} #{Name.last_name}"
      @first_name = name.split(' ').first
      @last_name = name.split(' ').last
    end

    def self.google
      uid = Number.number(9)
      auth = Omniauth.new()
      email = "#{auth.first_name.downcase}@example.com"
      {
        provider: "google_oauth2",
        uid: uid,
        info: {
          name: auth.name,
          first_name: auth.first_name,
          last_name: auth.last_name,
          email: email,
          image: image
        },
        credentials:  {
          token: Crypto.md5,
          refresh_token: Crypto.md5,
          expires_at: one_hour_from_now.to_i,
          expires: true
        },
        extra: {
          raw_info: {
            sub:  uid,
            email: email,
            email_verified: true,
            name: auth.name,
            given_name: auth.first_name,
            family_name: auth.last_name,
            profile: "https://plus.google.com/#{uid}",
            picture: image,
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
          "email" => email,
          "aud" => "APP_ID",
          "iat" => Number.number(10),
          "exp" => one_hour_from_now.to_i.to_s,
          "openid_id" => "https://www.google.com/accounts/o8/id?id=#{uid}"
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
          image: image,
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
        (-12..12).to_a.shuffle.pop
      end

      def self.updated_time
        time = Object::Time.now.to_s.split(' ')
        "#{Date.backward(365).to_s}T#{time[1]}#{time[2]}"
      end

      def self.image
        Placeholdit.image
      end
  end
end
