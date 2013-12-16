require 'rubygems'
require 'feedzirra'
require 'debugger'

module Faker
  class Flickr < Base

    class << self

      def image(tag=nil)
        key = tag || 'default'

        $flickr_public_feed ||= {}

        unless $flickr_public_feed[key]
          $flickr_public_feed[key] = Feedzirra::Feed.fetch_and_parse "http://api.flickr.com/services/feeds/photos_public.gne#{tag ? ('?tags='+tag) : ''}"
        end

        $flickr_public_feed[key].entries.sample.links.last
      end

    end
  end
end
