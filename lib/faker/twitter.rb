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
          contributors_enabled: Faker::Boolean.boolean(0.1),
          created_at: created_at,
          default_profile_image: Faker::Boolean.boolean(0.1),
          default_profile: Faker::Boolean.boolean(0.1),
          description: Faker::Lorem.sentence,
          entities:  user_entities,
          favourites_count: Faker::Number.between(1, 100_000),
          follow_request_sent: false,
          followers_count: Faker::Number.between(1, 10_000_000),
          following: false,
          friends_count: Faker::Number.between(1, 100_000),
          geo_enabled: Faker::Boolean.boolean(0.1),
          is_translation_enabled: Faker::Boolean.boolean(0.1),
          is_translator: Faker::Boolean.boolean(0.1),
          lang: Faker::Address.country_code,
          listed_count: Faker::Number.between(1, 1000),
          location: "#{Faker::Address.city}, #{Faker::Address.state_abbr}, #{Faker::Address.country_code}",
          name: Faker::Name.name,
          notifications: false,
          profile_background_color: Faker::Color.hex_color,
          profile_background_image_url_https: background_image_url,
          profile_background_image_url: background_image_url.sub('https://', 'http://'),
          profile_background_tile: Faker::Boolean.boolean(0.1),
          profile_banner_url: Faker::LoremPixel.image('1500x500'),
          profile_image_url_https: profile_image_url,
          profile_image_url: profile_image_url.sub('https://', 'http://'),
          profile_link_color: Faker::Color.hex_color,
          profile_sidebar_border_color: Faker::Color.hex_color,
          profile_sidebar_fill_color: Faker::Color.hex_color,
          profile_text_color: Faker::Color.hex_color,
          profile_use_background_image: Faker::Boolean.boolean(0.4),
          protected: Faker::Boolean.boolean(0.1),
          screen_name: Faker::Internet.user_name,
          statuses_count: Faker::Number.between(1, 100_000),
          time_zone: Faker::Address.time_zone,
          url: Faker::Internet.url('example.com'),
          utc_offset: utc_offset,
          verified: Faker::Boolean.boolean(0.1)
        }
        user[:status] = Faker::Twitter.status(include_user: false) if include_status
        user
      end

      def status(include_user: true)
        status_id = id
        status = {
          id: status_id,
          id_str: status_id.to_s,
          contributors: nil,
          coordinates: nil,
          created_at: created_at,
          entities:  status_entities,
          favorite_count: Faker::Number.between(1, 10_000),
          favorited: false,
          geo: nil,
          in_reply_to_screen_name: nil,
          in_reply_to_status_id: nil,
          in_reply_to_user_id_str: nil,
          in_reply_to_user_id: nil,
          is_quote_status: false,
          lang: Faker::Address.country_code,
          nil: nil,
          place: nil,
          possibly_sensitive: Faker::Boolean.boolean(0.1),
          retweet_count: Faker::Number.between(1, 10_000),
          retweeted_status:  nil,
          retweeted: false,
          source: "<a href=\"#{Faker::Internet.url('example.com')}\" rel=\"nofollow\">#{Faker::Company.name}</a>",
          text: Faker::Lorem.sentence,
          truncated: false
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

      def user_entities
        {
          url:  {
            urls: []
          },
          description:  {
            urls: []
          }
        }
      end

      def status_entities
        {
          hashtags:  [],
          symbols:  [],
          user_mentions:  [],
          urls:  []
        }
      end
    end
  end
end
