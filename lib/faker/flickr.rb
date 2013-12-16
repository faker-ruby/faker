require 'rubygems'
require 'feedzirra'
require 'debugger'

module Faker
  class Flickr < Base

    class << self

      def image(tag=nil)

        unless defined? $flickr_public_feed
          $flickr_public_feed = Feedzirra::Feed.fetch_and_parse "http://api.flickr.com/services/feeds/photos_public.gne#{tag ? tag : ''}"
        end

        $flickr_public_feed.entries.sample.links.last
      end

    end
  end
end
