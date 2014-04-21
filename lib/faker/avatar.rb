module Faker
  class Avatar < Base
    class << self
      def image(slug=nil)
        slug ||= Faker::Lorem.words.join
        "http://robohash.org/#{slug}"
      end
    end
  end
end
