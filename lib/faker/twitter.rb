module Faker
  class Twitter < Base
    class << self
      def user(include_status: true)
        user_id = id
        background_image_url = Faker::LoremPixel.image('600x400') # TODO: Make the dimensions change
        profile_image_url = Faker::Avatar.image(user_id, '48x48')
        user = {
          id: user_id,
          id_str: user_id.to_s,
          name: Faker::Name.name,
          screen_name: Faker::Internet.user_name,
          location: "#{Faker::Address.city}, #{Faker::Address.state_abbr}, #{Faker::Address.country_code}",
          description: Faker::Lorem.sentence,
          url: Faker::Internet.url('example.com'),
          entities:  nil, # TODO
          protected: Faker::Boolean.boolean(0.1),
          followers_count: Faker::Number.between(1, 10_000_000),
          friends_count: Faker::Number.between(1, 100_000),
          listed_count: Faker::Number.between(1, 1000),
          created_at: created_at,
          favourites_count: Faker::Number.between(1, 100_000),
          utc_offset: utc_offset,
          time_zone: Faker::Address.time_zone,
          geo_enabled: Faker::Boolean.boolean(0.1),
          verified: Faker::Boolean.boolean(0.1),
          statuses_count: Faker::Number.between(1, 100_000),
          lang: Faker::Address.country_code,
          contributors_enabled: Faker::Boolean.boolean(0.1),
          is_translator: Faker::Boolean.boolean(0.1),
          is_translation_enabled: Faker::Boolean.boolean(0.1),
          profile_background_color: Faker::Color.hex_color,
          profile_background_image_url: background_image_url.sub('https://', 'http://'),
          profile_background_image_url_https: background_image_url,
          profile_background_tile: Faker::Boolean.boolean(0.1),
          profile_image_url: profile_image_url.sub('https://', 'http://'),
          profile_image_url_https: profile_image_url,
          profile_banner_url: Faker::LoremPixel.image('1500x500'),
          profile_link_color: Faker::Color.hex_color,
          profile_sidebar_border_color: Faker::Color.hex_color,
          profile_sidebar_fill_color: Faker::Color.hex_color,
          profile_text_color: Faker::Color.hex_color,
          profile_use_background_image: Faker::Boolean.boolean(0.4),
          default_profile: Faker::Boolean.boolean(0.1),
          default_profile_image: Faker::Boolean.boolean(0.1),
          following: false,
          follow_request_sent: false,
          notifications: false
        }
        user[:status] = Faker::Twitter.status(include_user: false) if include_status
        user
      end

      def status(include_user: true)
        status_id = id
        status = {
          created_at: created_at,
          id: status_id,
          id_str: status_id.to_s,
          text: Faker::Lorem.sentence,
          truncated: false,
          entities:  nil, # TODO
          source: "<a href=\"#{Faker::Internet.url('example.com')}\" rel=\"nofollow\">#{Faker::Company.name}</a>",
          in_reply_to_status_id: nil,
          nil: nil,
          in_reply_to_user_id: nil,
          in_reply_to_user_id_str: nil,
          in_reply_to_screen_name: nil,
          geo: nil,
          coordinates: nil,
          place: nil,
          contributors: nil,
          retweeted_status:  nil,
          is_quote_status: false,
          retweet_count: Faker::Number.between(1, 10_000),
          favorite_count: Faker::Number.between(1, 10_000),
          favorited: false,
          retweeted: false,
          possibly_sensitive: Faker::Boolean.boolean(0.1),
          lang: Faker::Address.country_code
        }
        status[:user] = Faker::Twitter.user(include_status: false) if include_user
        status
      end

      private

      def id
        Faker::Number.between(1, 9_223_372_036_854_775_807)
      end

      def created_at
        Faker::Date.between('2006-03-21', ::Date.today).strftime('%a %b %d %H:%M:%S %z %Y')
      end

      def utc_offset
        Faker::Number.between(-43_200, 50_400)
      end
    end
  end
end
