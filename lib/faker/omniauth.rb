module Faker
  class Omniauth < Base
    require 'time'
    attr_reader :name,
                :first_name,
                :last_name

    def initialize
      @name = "#{Name.first_name} #{Name.last_name}"
      @first_name = name.split(' ').first
      @last_name = name.split(' ').last
    end

    class << self
      def google
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
              email_verified: random_boolean,
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

      def facebook
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
            verified: random_boolean
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
                name: city_state
              },
              gender: gender,
              email: email,
              timezone: timezone,
              locale: 'en_US',
              verified: random_boolean,
              updated_time: updated_time
            }
          }
        }
      end

      def twitter
        uid = Number.number(6)
        auth = Omniauth.new()
        location = city_state
        description = Lorem.sentence
        {
          provider: "twitter",
          uid: uid,
          info: {
            nickname: auth.name.downcase.gsub(' ', ''),
            name: auth.name,
            location: location,
            image: image,
            description: description,
            urls: {
              Website: nil,
              Twitter: "https://twitter.com/#{auth.name.downcase.gsub(' ', '')}"
            }
          },
          credentials: {
            token: Crypto.md5,
            secret: Crypto.md5
          },
          extra: {
            access_token: "",
            raw_info: {
              name: auth.name,
              listed_count: random_number_from_range(1..10),
              profile_sidebar_border_color: Color.hex_color,
              url: nil,
              lang: 'en',
              statuses_count: random_number_from_range(1..1000),
              profile_image_url: image,
              profile_background_image_url_https: image,
              location: location,
              time_zone: Address.city,
              follow_request_sent: random_boolean,
              id: uid,
              profile_background_tile: random_boolean,
              profile_sidebar_fill_color: Color.hex_color,
              followers_count: random_number_from_range(1..10000),
              default_profile_image: random_boolean,
              screen_name: '',
              following: random_boolean,
              utc_offset: timezone,
              verified: random_boolean,
              favourites_count: random_number_from_range(1..10),
              profile_background_color: Color.hex_color,
              is_translator: random_boolean,
              friends_count: random_number_from_range(1..10000),
              notifications: random_boolean,
              geo_enabled: random_boolean,
              profile_background_image_url: image,
              protected: random_boolean,
              description: description,
              profile_link_color: Color.hex_color,
              created_at: created_at,
              id_str: uid,
              profile_image_url_https: image,
              default_profile: random_boolean,
              profile_use_background_image: random_boolean,
              entities: {
                description: {
                  urls: []
                }
              },
              profile_text_color: Color.hex_color,
              contributors_enabled: random_boolean
            }
          }
        }
      end

      def linkedin
        uid = Number.number(6)
        auth = Omniauth.new()
        first_name = auth.first_name.downcase
        last_name = auth.last_name.downcase
        email = "#{first_name}@#{last_name}.com"
        location = city_state
        description = Lorem.sentence
        token = Crypto.md5
        secret = Crypto.md5
        industry = Commerce.department
        url = "http://www.linkedin.com/in/#{first_name}#{last_name}"
        {
          "provider" => "linkedin",
          "uid" => uid,
          "info" => {
            "name" => auth.name,
            "email" => email,
            "nickname" => auth.name,
            "first_name" => auth.first_name,
            "last_name" => auth.last_name,
            "location" => location,
            "description" => description,
            "image" => image,
            "phone" => PhoneNumber.phone_number,
            "headline" => description,
            "industry" => industry,
            "urls" => {
              "public_profile" => url
            }
          },
          "credentials" => {
            "token" => token,
            "secret" => secret
          },
          "extra" => {
            "access_token" => {
              "token" => token,
              "secret" => secret,
              "consumer" => nil,
              "params" => {
                oauth_token: token,
                oauth_token_secret: secret,
                oauth_expires_in: one_hour_from_now.to_i,
                oauth_authorization_expires_in: one_hour_from_now.to_i,
              },
              "response" => nil
            },
            "raw_info" => {
              "firstName" => auth.first_name,
              "headline" => description,
              "id" => uid,
              "industry" => industry,
              "lastName" => auth.last_name,
              "location" => {
                "country" => { "code" => Address.country_code.downcase },
                "name" => city_state.split(', ').first,
              },
              "pictureUrl" => image,
              "publicProfileUrl" => url
            }
          }
        }
      end

      private

        def one_hour_from_now
          Object::Time.now + (60 * 60)
        end

        def gender
          ["male", "female"].shuffle.pop
        end

        def timezone
          (-12..12).to_a.shuffle.pop
        end

        def time_now
          Object::Time.now.to_s.split(' ')
        end

        def updated_time
          "#{Date.backward(365).to_s}T#{time_now[1..2].join('')}"
        end

        def created_at
          Date.backward(3650).strftime("%a %b %d #{time_now[1..2].join(' ')} %Y")
        end

        def image
          Placeholdit.image
        end

        def city_state
          "#{Address.city}, #{Address.state}"
        end

        def random_number_from_range(range)
          range.to_a.shuffle.pop
        end

        def random_boolean
          [true, false].shuffle.pop
        end

      end
  end
end
