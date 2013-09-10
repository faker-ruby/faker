require 'rubygems'
require 'FlickRaw'

module Faker
  class Flickr < Base

    class << self

      def api_key(key)
        FlickRaw.api_key = key
      end

      def shared_secret(secret)
        FlickRaw.shared_secret = secret
      end

      # grap an image from flickr from the "Cream Of The Crop" group
      # http://www.flickr.com/groups/cotc/
      def image_cotc(tag="")

        # grep images, if not already done
        unless defined? @flickr_cotc_list
          @flickr_cotc_list = flickr.groups.pools.getPhotos(:group_id => "17274427@N00", 
                                                            :per_page => 100, 
                                                            :tags => tag).to_a
        end

        # take a random element from the list
        open( FlickRaw.url( @flickr_cotc_list.sample ) )
      end
         
         
      def image_bw
        image_cotc("bw")
      end   
            
      alias_method :image, :image_cotc

    end
  end
end
